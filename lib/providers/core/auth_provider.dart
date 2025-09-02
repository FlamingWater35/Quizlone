import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/providers/core/core_providers.dart';
import '../study/study_list_providers.dart';

part 'auth_provider.g.dart';

final _log = Logger("AuthProvider");

@riverpod
class AuthController extends _$AuthController {
  StreamSubscription<AuthState>? _authStateSubscription;

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

  Future<void> _onSignIn() async {
    final cloudSyncService = ref.read(cloudSyncServiceProvider);
    final dbService = ref.read(databaseServiceProvider);

    try {
      _log.info("User signed in. Attempting to download cloud data.");
      final cloudData = await cloudSyncService.downloadData();

      if (cloudData != null) {
        _log.info("Cloud data found, applying to local database.");
        await dbService.applyCloudData(cloudData);

        ref.invalidate(studyListsProvider);
        _log.info("Local database synced with cloud data.");
      } else {
        _log.info(
          "No cloud data found. Triggering initial upload from local data.",
        );
        await dbService.triggerCloudUpload();
      }
    } catch (e, s) {
      _log.severe("Error during post-signin sync", e, s);
    }
  }

  void _onSignOut() {
    _log.info("User signed out. Local data remains.");
  }

  @override
  AsyncValue<User?> build() {
    _authStateSubscription?.cancel();
    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange
        .listen((data) async {
          final session = data.session;
          state = AsyncData(session?.user);
          _log.fine("AuthState changed. User is now: ${session?.user.id}");

          if (data.event == AuthChangeEvent.signedIn) {
            await _onSignIn();
          } else if (data.event == AuthChangeEvent.signedOut) {
            _onSignOut();
          }
        });

    ref.onDispose(() {
      _authStateSubscription?.cancel();
    });

    final initialUser = Supabase.instance.client.auth.currentUser;
    return AsyncData(initialUser);
  }
}
