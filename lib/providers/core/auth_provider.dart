import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/models/settings_app_data.dart';
import '/models/study_list.dart';
import '/providers/core/core_providers.dart';
import '/providers/study/study_list_providers.dart';
import '../../models/match_record.dart';
import 'connectivity_provider.dart';

part 'auth_provider.g.dart';

final _log = Logger("AuthProvider");

class _MergeInput {
  _MergeInput({
    required this.local,
    required this.remote,
    required this.localTimestamp,
  });

  final AppData local;
  final DateTime? localTimestamp;
  final AppData remote;
}

class _MergeResult {
  _MergeResult({required this.mergedData, required this.wasLocalUpdated});

  final AppData mergedData;
  final bool wasLocalUpdated;
}

_MergeResult _runMergeInIsolate(_MergeInput input) {
  final local = input.local;
  final remote = input.remote;
  final localTimestamp = input.localTimestamp;

  bool wasLocalUpdated = false;

  final remoteListsMap = {for (var list in remote.studyLists) list.id: list};
  final mergedListsMap = Map<String, StudyList>.from(remoteListsMap);

  for (final localList in local.studyLists) {
    if (remoteListsMap.containsKey(localList.id)) {
      final remoteList = remoteListsMap[localList.id]!;
      if (localList.lastUsedAt.isAfter(remoteList.lastUsedAt)) {
        mergedListsMap[localList.id] = localList;
      } else if (remoteList.lastUsedAt.isAfter(localList.lastUsedAt)) {
        wasLocalUpdated = true;
      }
    } else {
      if (localTimestamp == null ||
          localList.createdAt.isAfter(localTimestamp)) {
        mergedListsMap[localList.id] = localList;
      } else {
        wasLocalUpdated = true;
      }
    }
  }

  final localIds = local.studyLists.map((l) => l.id).toSet();
  if (remote.studyLists.any((rl) => !localIds.contains(rl.id))) {
    wasLocalUpdated = true;
  }

  final remoteRecordsSet = remote.matchRecords
      .map((r) => "${r.studyListId}-${r.createdAt.toIso8601String()}")
      .toSet();
  final localRecordsSet = local.matchRecords
      .map((r) => "${r.studyListId}-${r.createdAt.toIso8601String()}")
      .toSet();

  final mergedRecords = List<MatchRecord>.from(remote.matchRecords);

  for (final localRecord in local.matchRecords) {
    final key =
        "${localRecord.studyListId}-${localRecord.createdAt.toIso8601String()}";
    if (!remoteRecordsSet.contains(key)) {
      mergedRecords.add(localRecord);
    }
  }

  if (remote.matchRecords.any((rr) {
    final key = "${rr.studyListId}-${rr.createdAt.toIso8601String()}";
    return !localRecordsSet.contains(key);
  })) {
    wasLocalUpdated = true;
  }

  final remoteTestsMap = {for (var t in remote.testRecords) t.id: t};
  final mergedTestsMap = Map<String, TestRecord>.from(remoteTestsMap);

  for (final localTest in local.testRecords) {
    if (!mergedTestsMap.containsKey(localTest.id)) {
      mergedTestsMap[localTest.id] = localTest;
    }
  }

  final localTestIds = local.testRecords.map((t) => t.id).toSet();
  if (remote.testRecords.any((rt) => !localTestIds.contains(rt.id))) {
    wasLocalUpdated = true;
  }

  final mergedGroupsMap = {
    for (var group in remote.studyGroups) group.id: group,
  };
  for (final localGroup in local.studyGroups) {
    if (!mergedGroupsMap.containsKey(localGroup.id)) {
      mergedGroupsMap[localGroup.id] = localGroup;
    }
  }

  final localGroupIds = local.studyGroups.map((g) => g.id).toSet();
  if (remote.studyGroups.any((rg) => !localGroupIds.contains(rg.id))) {
    wasLocalUpdated = true;
  }

  return _MergeResult(
    mergedData: AppData(
      studyLists: mergedListsMap.values.toList(),
      matchRecords: mergedRecords,
      studyGroups: mergedGroupsMap.values.toList(),
      testRecords: mergedTestsMap.values.toList(),
    ),
    wasLocalUpdated: wasLocalUpdated,
  );
}

@Riverpod(keepAlive: true)
class SyncHealth extends _$SyncHealth {
  void setError(String? error) => state = error;

  void clear() => state = null;

  @override
  String? build() => null;
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController with WidgetsBindingObserver {
  static const _authErrorDebounceMs = 5000;
  static const int _maxConsecutiveErrors = 3;

  StreamSubscription<AuthState>? _authStateSubscription;
  bool _circuitOpen = false;
  int _consecutiveSyncErrors = 0;
  bool _initialSyncDone = false;
  bool _isSyncing = false;
  DateTime? _lastAuthErrorTime;
  bool _syncPending = false;
  Timer? _syncTimer;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _log.info("App resumed. Requesting cloud sync check.");
      requestCloudSync();
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      _log.warning('Sign in failed', e);
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
    } catch (e) {
      _log.warning('Sign up failed', e);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } catch (e) {
      _log.warning('Sign out failed', e);
      rethrow;
    }
  }

  Future<void> clearLocalDataOnSignOut() async {
    _log.info("User requested clearing of local data on sign out.");
    final dbService = ref.read(databaseServiceProvider);
    await dbService.clearAllUserData();
    if (!ref.mounted) return;
    ref.invalidate(studyListsProvider);
    ref.read(activeStudyListIdProvider.notifier).set(null);
  }

  Future<void> requestCloudSync({bool isInitialSync = false}) async {
    if (_isSyncing || _circuitOpen) {
      if (!_circuitOpen) _syncPending = true;
      return;
    }

    _isSyncing = true;
    final healthNotifier = ref.read(syncHealthProvider.notifier);

    do {
      _syncPending = false;
      try {
        await _performSync(isInitialSync: isInitialSync);
        healthNotifier.clear();
        _consecutiveSyncErrors = 0;
        _circuitOpen = false;
      } on AuthRetryableFetchException catch (e) {
        _handleSyncError(e, healthNotifier);
      } on SocketException catch (e) {
        _handleSyncError(e, healthNotifier);
      } catch (e) {
        _log.severe("Sync failed", e);
        healthNotifier.setError(t.drawer.syncError);
        _consecutiveSyncErrors++;
      }
      isInitialSync = false;
    } while (_syncPending && !_circuitOpen);

    _isSyncing = false;
  }

  Future<void> deleteAccount() async {
    final cloudService = ref.read(cloudSyncServiceProvider);
    await cloudService.deleteAccount();
    await signOut();
  }

  Future<void> resetCircuitAndSync() async {
    _circuitOpen = false;
    _consecutiveSyncErrors = 0;
    await requestCloudSync();
  }

  void _handleSyncError(dynamic e, SyncHealth healthNotifier) {
    _consecutiveSyncErrors++;
    _log.warning("Sync network error (attempt $_consecutiveSyncErrors)", e);
    healthNotifier.setError(t.drawer.syncErrorOffline);
    if (_consecutiveSyncErrors >= _maxConsecutiveErrors) {
      _circuitOpen = true;
      _stopPolling();
      _log.warning("Circuit breaker opened");
    }
  }

  Future<void> _performUpload() async {
    final dbService = ref.read(databaseServiceProvider);
    final cloudSyncService = ref.read(cloudSyncServiceProvider);

    final appData = AppData(
      studyLists: await dbService.getAllStudyLists(),
      matchRecords: await dbService.getAllMatchRecords(),
      studyGroups: await dbService.getAllStudyGroups(),
      testRecords: await dbService.getAllTestRecords(),
    );

    if (!ref.mounted) return;
    await cloudSyncService.uploadData(appData);
    if (!ref.mounted) return;
    await dbService.saveLastSyncTimestamp(DateTime.now().toUtc());
  }

  Future<bool> _performInitialSync() async {
    try {
      await requestCloudSync(isInitialSync: true);
      return ref.read(syncHealthProvider) == null;
    } catch (e) {
      return false;
    }
  }

  Future<void> _performSync({bool isInitialSync = false}) async {
    final connectivityStatus = await ref.read(connectivityProvider.future);
    if (!ref.mounted || connectivityStatus == ConnectivityResult.none) return;

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    final cloudSyncService = ref.read(cloudSyncServiceProvider);
    final dbService = ref.read(databaseServiceProvider);

    try {
      final cloudResponse = await cloudSyncService.getCloudData();
      if (!ref.mounted) return;
      final cloudData = cloudResponse.data;
      final cloudTimestamp = cloudResponse.timestamp;

      final localLists = await dbService.getAllStudyLists();
      final localRecords = await dbService.getAllMatchRecords();
      final localGroups = await dbService.getAllStudyGroups();
      final localTimestamp = dbService.getLastSyncTimestamp();

      final hasLocalData =
          localLists.isNotEmpty ||
          localRecords.isNotEmpty ||
          localGroups.isNotEmpty;
      final hasCloudData = cloudData != null;

      if (isInitialSync) {
        if (hasCloudData) {
          await dbService.applyCloudData(cloudData);
          if (cloudTimestamp != null) {
            await dbService.saveLastSyncTimestamp(cloudTimestamp);
          }
        } else if (hasLocalData) {
          await _performUpload();
        }
      } else {
        if (!hasCloudData && hasLocalData) {
          await _performUpload();
        } else if (hasCloudData && !hasLocalData) {
          await dbService.applyCloudData(cloudData);
          if (cloudTimestamp != null) {
            await dbService.saveLastSyncTimestamp(cloudTimestamp);
          }
        } else if (hasCloudData && hasLocalData) {
          final cloudInstanceId = cloudData.lastUpdatedBy;
          final localInstanceId = ref.read(instanceIdProvider);
          final isCloudNewer =
              cloudTimestamp != null &&
              (localTimestamp == null ||
                  cloudTimestamp.isAfter(localTimestamp));

          if (isCloudNewer && cloudInstanceId != localInstanceId) {
            final localData = AppData(
              studyLists: localLists,
              matchRecords: localRecords,
              studyGroups: localGroups,
              testRecords: await dbService.getAllTestRecords(),
            );

            final mergeResult = await compute(
              _runMergeInIsolate,
              _MergeInput(
                local: localData,
                remote: cloudData,
                localTimestamp: localTimestamp,
              ),
            );

            if (!ref.mounted) return;

            if (!mergeResult.wasLocalUpdated) {
              _log.info(
                "Merge result is identical to local data. Skipping DB write.",
              );
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
            } else {
              _log.info("Applying merged data and re-uploading.");
              await dbService.applyCloudData(mergeResult.mergedData);
              if (!ref.mounted) return;
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
              if (!ref.mounted) return;
              await _performUpload();
            }
          } else {
            await _performUpload();
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void _onSignOut() {
    _stopPolling();
    _initialSyncDone = false;
  }

  void _startPolling() {
    _stopPolling();
    _syncTimer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) => requestCloudSync(),
    );
  }

  void _stopPolling() {
    _syncTimer?.cancel();
    _syncTimer = null;
  }

  @override
  AsyncValue<User?> build() {
    _authStateSubscription?.cancel();
    WidgetsBinding.instance.addObserver(this);

    ref.listen<AsyncValue<ConnectivityResult>>(connectivityProvider, (
      previous,
      next,
    ) {
      if (previous?.value == ConnectivityResult.none &&
          next.value != ConnectivityResult.none) {
        requestCloudSync();
      }
    });

    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen(
          (data) async {
            final session = data.session;
            state = AsyncData(session?.user);

            final isSignInEvent =
                data.event == AuthChangeEvent.initialSession ||
                data.event == AuthChangeEvent.signedIn;

            if (isSignInEvent && session != null && !_initialSyncDone) {
              final success = await _performInitialSync();
              if (ref.mounted && success) {
                _startPolling();
                _initialSyncDone = true;
              }
            } else if (data.event == AuthChangeEvent.signedOut) {
              _onSignOut();
            }
          },
          onError: (error) {
            final now = DateTime.now();
            if (_lastAuthErrorTime != null &&
                now.difference(_lastAuthErrorTime!).inMilliseconds <
                    _authErrorDebounceMs) {
              return;
            }
            _lastAuthErrorTime = now;
            if (ref.mounted) {
              ref
                  .read(syncHealthProvider.notifier)
                  .setError(t.drawer.syncErrorOffline);
            }
          },
        );

    ref.onDispose(() {
      _authStateSubscription?.cancel();
      _stopPolling();
      WidgetsBinding.instance.removeObserver(this);
    });

    return AsyncData(Supabase.instance.client.auth.currentUser);
  }
}
