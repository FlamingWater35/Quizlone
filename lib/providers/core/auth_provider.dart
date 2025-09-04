import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/providers/core/core_providers.dart';
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
      _checkForCloudUpdates();
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

  Future<void> _checkForCloudUpdates({bool force = false}) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
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
    _log.fine("Checking for cloud updates...");

    final cloudSyncService = ref.read(cloudSyncServiceProvider);
    final dbService = ref.read(databaseServiceProvider);

    try {
      final response = await cloudSyncService.getCloudData();
      final cloudData = response.data;
      final cloudTimestamp = response.timestamp;

      if (cloudData == null || cloudTimestamp == null) {
        _log.info("No cloud data exists. Triggering initial upload.");
        await dbService.triggerCloudUpload();
        return;
      }

      final localTimestamp = dbService.getLastSyncTimestamp();

      if (force ||
          localTimestamp == null ||
          cloudTimestamp.isAfter(localTimestamp)) {
        _log.info(
          "Cloud data is newer (Cloud: $cloudTimestamp, Local: $localTimestamp). Applying...",
        );
        await dbService.applyCloudData(cloudData);
        await dbService.saveLastSyncTimestamp(cloudTimestamp);
        _log.info("Successfully synced with cloud data.");
      } else {
        _log.fine("Local data is up to date.");
      }
    } catch (e, s) {
      _log.severe("Error during cloud update check", e, s);
    } finally {
      _isSyncing = false;
    }
  }

  void _onSignOut() {
    _log.info("User signed out. Stopping sync timer.");
    _stopPolling();
  }

  void _startPolling() {
    _stopPolling();
    _log.info("Starting periodic sync timer (every 10 seconds).");
    _syncTimer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) => _checkForCloudUpdates(),
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
      final isConnected = next.valueOrNull != ConnectivityResult.none;
      final wasConnected = previous?.valueOrNull != ConnectivityResult.none;

      if (!wasConnected && isConnected) {
        _log.info("Connection restored. Triggering a full cloud sync.");
        _checkForCloudUpdates(force: true);
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
            await _checkForCloudUpdates(force: true);
            _startPolling();
            _initialSyncDone = true;
          } else if (data.event == AuthChangeEvent.signedOut) {
            _onSignOut();
            _initialSyncDone = false;
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
