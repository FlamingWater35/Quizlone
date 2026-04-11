import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
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
      if (_circuitOpen) {
        _log.fine("Circuit breaker open, skipping sync");
      } else {
        _log.fine("Sync already in progress, scheduling a new one.");
        _syncPending = true;
      }
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
        _consecutiveSyncErrors++;
        _log.warning("Auth network error (attempt $_consecutiveSyncErrors)", e);
        healthNotifier.setError(t.drawer.syncErrorOffline);

        if (_consecutiveSyncErrors >= _maxConsecutiveErrors) {
          _circuitOpen = true;
          _stopPolling();
          _log.warning(
            "Circuit breaker opened after $_maxConsecutiveErrors failures",
          );
        }
      } on SocketException catch (e) {
        _consecutiveSyncErrors++;
        _log.warning("Network error (attempt $_consecutiveSyncErrors)", e);
        healthNotifier.setError(t.drawer.syncErrorOffline);

        if (_consecutiveSyncErrors >= _maxConsecutiveErrors) {
          _circuitOpen = true;
          _stopPolling();
        }
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

  AppData _mergeData({
    required AppData local,
    required AppData remote,
    required DateTime? localTimestamp,
  }) {
    _log.fine("Merging local and remote data...");

    final remoteListsMap = {for (var list in remote.studyLists) list.id: list};
    final mergedListsMap = Map<String, StudyList>.from(remoteListsMap);

    for (final localList in local.studyLists) {
      if (remoteListsMap.containsKey(localList.id)) {
        final remoteList = remoteListsMap[localList.id]!;
        if (localList.lastUsedAt.isAfter(remoteList.lastUsedAt)) {
          mergedListsMap[localList.id] = localList;
        }
      } else {
        if (localTimestamp == null ||
            localList.createdAt.isAfter(localTimestamp)) {
          mergedListsMap[localList.id] = localList;
        }
      }
    }
    final mergedLists = mergedListsMap.values.toList();
    _log.fine("Merged ${mergedLists.length} lists.");

    final remoteRecordsSet = remote.matchRecords
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
    _log.fine("Merged ${mergedRecords.length} records.");

    final remoteTestsMap = {for (var t in remote.testRecords) t.id: t};
    final mergedTestsMap = Map<String, TestRecord>.from(remoteTestsMap);

    for (final localTest in local.testRecords) {
      if (!mergedTestsMap.containsKey(localTest.id)) {
        mergedTestsMap[localTest.id] = localTest;
      }
    }
    final mergedTestRecords = mergedTestsMap.values.toList();
    _log.fine("Merged ${mergedTestRecords.length} test records.");

    final mergedGroupsMap = {
      for (var group in remote.studyGroups) group.id: group,
    };
    for (final localGroup in local.studyGroups) {
      if (!mergedGroupsMap.containsKey(localGroup.id)) {
        mergedGroupsMap[localGroup.id] = localGroup;
      }
    }
    final mergedGroups = mergedGroupsMap.values.toList();
    _log.fine("Merged ${mergedGroups.length} groups.");

    return AppData(
      studyLists: mergedLists,
      matchRecords: mergedRecords,
      studyGroups: mergedGroups,
      testRecords: mergedTestRecords,
    );
  }

  Future<void> _performUpload() async {
    final dbService = ref.read(databaseServiceProvider);
    final cloudSyncService = ref.read(cloudSyncServiceProvider);

    final lists = await dbService.getAllStudyLists();
    if (!ref.mounted) return;
    final records = await dbService.getAllMatchRecords();
    if (!ref.mounted) return;
    final groups = await dbService.getAllStudyGroups();
    if (!ref.mounted) return;
    final tests = await dbService.getAllTestRecords();
    if (!ref.mounted) return;

    final appData = AppData(
      studyLists: lists,
      matchRecords: records,
      studyGroups: groups,
      testRecords: tests,
    );
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
    if (!ref.mounted) return;

    if (connectivityStatus == ConnectivityResult.none) {
      _log.info("Offline mode: Sync check skipped.");
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    _log.info("Starting cloud sync... (Initial: $isInitialSync)");
    final healthNotifier = ref.read(syncHealthProvider.notifier);

    final cloudSyncService = ref.read(cloudSyncServiceProvider);
    final dbService = ref.read(databaseServiceProvider);

    try {
      final cloudResponse = await cloudSyncService.getCloudData();
      if (!ref.mounted) return;
      final cloudData = cloudResponse.data;
      final cloudTimestamp = cloudResponse.timestamp;

      final localLists = await dbService.getAllStudyLists();
      if (!ref.mounted) return;
      final localRecords = await dbService.getAllMatchRecords();
      if (!ref.mounted) return;
      final localGroups = await dbService.getAllStudyGroups();
      if (!ref.mounted) return;

      final localTimestamp = dbService.getLastSyncTimestamp();

      final hasLocalData =
          localLists.isNotEmpty ||
          localRecords.isNotEmpty ||
          localGroups.isNotEmpty;
      final hasCloudData = cloudData != null;

      if (isInitialSync) {
        if (hasCloudData) {
          _log.info(
            "Initial sync: Cloud data found. Applying to local storage.",
          );
          await dbService.applyCloudData(cloudData);
          if (!ref.mounted) return;
          if (cloudTimestamp != null) {
            await dbService.saveLastSyncTimestamp(cloudTimestamp);
          }
        } else if (hasLocalData) {
          _log.info("Initial sync: No cloud data. Uploading local data.");
          await _performUpload();
        } else {
          _log.info("Initial sync: No local or cloud data. Nothing to sync.");
        }
      } else {
        if (!hasCloudData && hasLocalData) {
          _log.info("No cloud data found. Uploading local data.");
          await _performUpload();
        } else if (hasCloudData && !hasLocalData) {
          _log.info("No local data found. Downloading cloud data.");
          await dbService.applyCloudData(cloudData);
          if (!ref.mounted) return;
          if (cloudTimestamp != null) {
            await dbService.saveLastSyncTimestamp(cloudTimestamp);
          }
        } else if (hasCloudData && hasLocalData) {
          _log.info("Both local and cloud data exist. Deciding sync strategy.");
          final cloudInstanceId = cloudData.lastUpdatedBy;
          final localInstanceId = ref.read(instanceIdProvider);
          final isCloudNewer =
              cloudTimestamp != null &&
              (localTimestamp == null ||
                  cloudTimestamp.isAfter(localTimestamp));

          if (isCloudNewer && cloudInstanceId != localInstanceId) {
            _log.info("Cloud data is newer. Merging...");
            final localData = AppData(
              studyLists: localLists,
              matchRecords: localRecords,
              studyGroups: localGroups,
              testRecords: await dbService.getAllTestRecords(),
            );
            final mergedData = _mergeData(
              local: localData,
              remote: cloudData,
              localTimestamp: localTimestamp,
            );

            final localDataJson = jsonEncode(localData.toJson());
            final mergedDataJson = jsonEncode(mergedData.toJson());

            if (localDataJson == mergedDataJson) {
              _log.info(
                "Merge result is identical to local data. Skipping DB write.",
              );
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
            } else {
              _log.info("Applying merged data and re-uploading.");
              await dbService.applyCloudData(mergedData);
              if (!ref.mounted) return;
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
              if (!ref.mounted) return;
              await _performUpload();
            }
          } else {
            _log.info("Local data is up-to-date or newer. Uploading to cloud.");
            await _performUpload();
          }
        }
      }
    } on AuthRetryableFetchException catch (e) {
      _log.warning("Auth network error during sync (Supabase paused?)", e);
      healthNotifier.setError(t.drawer.syncErrorOffline);
      rethrow;
    } on SocketException catch (e) {
      _log.warning("Network error during sync (Host unreachable)", e);
      healthNotifier.setError(t.drawer.syncErrorOffline);
      rethrow;
    } on ClientException catch (e) {
      _log.warning("HTTP client error during sync", e);
      healthNotifier.setError(t.drawer.syncErrorOffline);
      rethrow;
    } catch (e, s) {
      _log.severe("Error during cloud sync", e, s);
      healthNotifier.setError(t.drawer.syncError);
      rethrow;
    } finally {
      _log.info("Cloud sync finished.");
    }
  }

  void _onSignOut() {
    _log.info("User signed out. Stopping sync timer.");
    _stopPolling();
    _initialSyncDone = false;
  }

  void _startPolling() {
    _stopPolling();
    _log.info("Starting periodic sync timer (every 30 seconds).");
    _syncTimer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) => requestCloudSync(),
    );
  }

  void _stopPolling() {
    _syncTimer?.cancel();
    _syncTimer = null;
    _log.fine("Sync timer stopped.");
  }

  @override
  AsyncValue<User?> build() {
    _authStateSubscription?.cancel();
    WidgetsBinding.instance.addObserver(this);

    ref.listen<AsyncValue<ConnectivityResult>>(connectivityProvider, (
      previous,
      next,
    ) {
      final wasConnected = previous?.value != ConnectivityResult.none;
      final isConnected = next.value != ConnectivityResult.none;

      if (!wasConnected && isConnected) {
        _log.info("Connection restored. Triggering a cloud sync.");
        requestCloudSync();
      }
    });

    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen(
          (data) async {
            final session = data.session;
            state = AsyncData(session?.user);
            _log.fine(
              "AuthState changed. Event: ${data.event}, User: ${session?.user.id}",
            );

            final isSignInEvent =
                data.event == AuthChangeEvent.initialSession ||
                data.event == AuthChangeEvent.signedIn;

            if (isSignInEvent && session != null && !_initialSyncDone) {
              _log.info("Initial sign-in detected. Performing first sync.");
              final success = await _performInitialSync();

              if (!ref.mounted) return;

              if (success) {
                _startPolling();
                _initialSyncDone = true;
              } else {
                _log.info("Initial sync failed, operating in offline mode");
              }
            } else if (data.event == AuthChangeEvent.signedOut) {
              _onSignOut();
              _initialSyncDone = false;
            }
          },
          onError: (error, stackTrace) {
            final now = DateTime.now();
            if (_lastAuthErrorTime != null &&
                now.difference(_lastAuthErrorTime!).inMilliseconds <
                    _authErrorDebounceMs) {
              return;
            }
            _lastAuthErrorTime = now;

            _log.warning("Auth stream error (offline?): $error");
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

    final initialUser = Supabase.instance.client.auth.currentUser;
    return AsyncData(initialUser);
  }
}
