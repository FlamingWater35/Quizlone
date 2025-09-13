import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
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
class AuthController extends _$AuthController with WidgetsBindingObserver {
  StreamSubscription<AuthState>? _authStateSubscription;
  bool _initialSyncDone = false;
  bool _isSyncing = false;
  Timer? _syncTimer;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _log.info("App resumed. Checking for cloud updates.");
      _syncWithCloud();
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
    ref.invalidate(studyListsProvider);
    ref.read(activeStudyListIdProvider.notifier).set(null);
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

    final remoteRecordsSet =
        remote.matchRecords
            .map((r) => "${r.studyListName}-${r.createdAt.toIso8601String()}")
            .toSet();
    final mergedRecords = List<MatchRecord>.from(remote.matchRecords);

    for (final localRecord in local.matchRecords) {
      final key =
          "${localRecord.studyListName}-${localRecord.createdAt.toIso8601String()}";
      if (!remoteRecordsSet.contains(key)) {
        mergedRecords.add(localRecord);
      }
    }
    _log.fine("Merged ${mergedRecords.length} records.");

    final mergedListIds = mergedLists.map((e) => e.id).toSet();
    final mergedOrder =
        remote.studyListOrder
            .where((id) => mergedListIds.contains(id))
            .toList();
    final mergedOrderSet = mergedOrder.toSet();

    for (final list in mergedLists) {
      if (!mergedOrderSet.contains(list.id)) {
        mergedOrder.add(list.id);
      }
    }
    _log.fine("Merged list order with ${mergedOrder.length} items.");

    return AppData(
      studyLists: mergedLists,
      matchRecords: mergedRecords,
      studyListOrder: mergedOrder,
    );
  }

  Future<void> _syncWithCloud({bool isInitialSync = false}) async {
    final connectivityStatus = await ref.read(connectivityProvider.future);

    if (connectivityStatus == ConnectivityResult.none) {
      _log.info("Offline mode: Sync check skipped.");
      return;
    }

    if (_isSyncing) {
      _log.fine("Sync operation already in progress. Skipping.");
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) return;

    _isSyncing = true;
    _log.info("Starting cloud sync... (Initial: $isInitialSync)");

    final cloudSyncService = ref.read(cloudSyncServiceProvider);
    final dbService = ref.read(databaseServiceProvider);

    try {
      final cloudResponse = await cloudSyncService.getCloudData();
      final cloudData = cloudResponse.data;
      final cloudTimestamp = cloudResponse.timestamp;

      final localLists = await dbService.getAllStudyLists();
      final localRecords = await dbService.getAllMatchRecords();
      final localOrder = dbService.getStudyListOrder();
      final localTimestamp = dbService.getLastSyncTimestamp();

      final hasLocalData = localLists.isNotEmpty || localRecords.isNotEmpty;
      final hasCloudData = cloudData != null;

      if (isInitialSync) {
        if (hasCloudData) {
          _log.info(
            "Initial sync: Cloud data found. Overwriting local data to ensure account consistency.",
          );
          await dbService.applyCloudData(cloudData);
          if (cloudTimestamp != null) {
            await dbService.saveLastSyncTimestamp(cloudTimestamp);
          }
        } else if (hasLocalData) {
          _log.info(
            "Initial sync: No cloud data found for this account. Uploading local data as the first version.",
          );
          await dbService.triggerCloudUpload();
        } else {
          _log.info("Initial sync: No local or cloud data. Nothing to sync.");
        }
      } else {
        if (!hasCloudData && hasLocalData) {
          _log.info("No cloud data found. Uploading local data.");
          await dbService.triggerCloudUpload();
        } else if (hasCloudData && !hasLocalData) {
          _log.info("No local data found. Downloading cloud data.");
          if (cloudTimestamp != null) {
            await dbService.applyCloudData(cloudData);
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
            _log.info(
              "Cloud data is newer and from another instance. Merging...",
            );
            final localData = AppData(
              studyLists: localLists,
              matchRecords: localRecords,
              studyListOrder: localOrder,
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
                "Merge result is identical to local data. Skipping database write.",
              );
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
            } else {
              _log.info("Local data changed after merge. Applying updates.");
              await dbService.applyCloudData(mergedData);
              await dbService.saveLastSyncTimestamp(cloudTimestamp);
              await dbService.triggerCloudUpload();
              _log.info("Merge complete and new data uploaded.");
            }
          } else {
            _log.info("Local data is up-to-date or newer. Uploading to cloud.");
            await dbService.triggerCloudUpload();
          }
        }
      }
    } catch (e, s) {
      _log.severe("Error during cloud sync", e, s);
    } finally {
      _isSyncing = false;
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
    _log.info("Starting periodic sync timer (every 10 seconds).");
    _syncTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) => _syncWithCloud(),
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
      final wasConnected = previous?.valueOrNull != ConnectivityResult.none;
      final isConnected = next.valueOrNull != ConnectivityResult.none;

      if (!wasConnected && isConnected) {
        _log.info("Connection restored. Triggering a cloud sync.");
        _syncWithCloud();
      }
    });

    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen((data) async {
          final session = data.session;
          state = AsyncData(session?.user);
          _log.fine(
            "AuthState changed. Event: ${data.event}, User: ${session?.user.id}",
          );

          if (session != null && !_initialSyncDone) {
            _log.info("Initial session detected. Performing first sync.");
            await _syncWithCloud(isInitialSync: true);
            _startPolling();
            _initialSyncDone = true;
          } else if (data.event == AuthChangeEvent.signedOut) {
            _onSignOut();
          }
        });

    ref.onDispose(() {
      _authStateSubscription?.cancel();
      _stopPolling();
      WidgetsBinding.instance.removeObserver(this);
    });

    final initialUser = Supabase.instance.client.auth.currentUser;
    return AsyncData(initialUser);
  }
}
