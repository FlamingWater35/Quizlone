import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/settings_app_data.dart';
import '../providers/core/core_providers.dart';

final _log = Logger('CloudSyncService');

/// Encapsulates the response from the cloud database, including the timestamp.
/// Used to determine if local or remote data is newer during merge conflicts.
class CloudDataResponse {
  CloudDataResponse(this.data, this.timestamp);
  final AppData? data;
  final DateTime? timestamp;
}

/// Manages all network interactions with the Supabase backend.
/// Isolates cloud logic from local DB logic to maintain single-responsibility principles.
class CloudSyncService {
  CloudSyncService(this.ref);
  final Ref ref;

  static const String _tableName = 'user_data';
  final SupabaseClient _client = Supabase.instance.client;

  /// Fetches the user's serialized app data and last update timestamp from Supabase.
  /// Returns empty response instead of throwing on 404 (PGRST116) to simplify initial sync logic.
  Future<CloudDataResponse> getCloudData() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      return CloudDataResponse(null, null);
    }

    try {
      final response = await _client
          .from(_tableName)
          .select('data, last_updated_at')
          .eq('user_id', user.id)
          .single();

      final data = response['data'] != null
          ? AppData.fromJson(response['data'] as Map<String, dynamic>)
          : null;

      final rawTimestamp = response['last_updated_at'];
      final timestamp = rawTimestamp != null
          ? DateTime.tryParse(rawTimestamp.toString())
          : null;

      _log.fine(
        'Successfully downloaded cloud data with timestamp: $timestamp',
      );
      return CloudDataResponse(data, timestamp);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        _log.info('No cloud data found for user ${user.id}.');
        return CloudDataResponse(null, null);
      }
      _log.severe('Supabase PostgREST error downloading data', e);
      rethrow;
    } catch (e, s) {
      _log.severe('Unexpected network/parsing error downloading data', e, s);
      rethrow;
    }
  }

  /// Serializes and uploads the entire local AppData state to Supabase.
  /// Attaches the device instance ID to prevent infinite sync loops between devices.
  Future<void> uploadData(AppData data) async {
    final user = _client.auth.currentUser;
    if (user == null) {
      _log.info('No user logged in, skipping data upload.');
      return;
    }

    try {
      final instanceId = ref.read(instanceIdProvider);
      final dataToUpload = data.copyWith(lastUpdatedBy: instanceId);
      final jsonData = dataToUpload.toJson();

      await _client.from(_tableName).upsert({
        'user_id': user.id,
        'data': jsonData,
        'last_updated_at': DateTime.now().toUtc().toIso8601String(),
      });
      _log.fine('Successfully uploaded data for user ${user.id}.');
    } catch (e, s) {
      _log.severe('Failed to upload data to Supabase', e, s);
      rethrow;
    }
  }

  /// Deletes the user's cloud record, typically used when clearing local data or signing out.
  Future<void> deleteCloudData() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      _log.info('No user logged in, skipping cloud data deletion.');
      return;
    }

    try {
      await _client.from(_tableName).delete().eq('user_id', user.id);
      _log.fine('Successfully deleted cloud data for user ${user.id}.');
    } catch (e, s) {
      _log.severe('Failed to delete cloud data', e, s);
      rethrow;
    }
  }

  /// Executes account deletion via Supabase RPC and cleans up cloud records.
  /// Ensures GDPR compliance and prevents orphaned database rows.
  Future<void> deleteAccount() async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    try {
      await deleteCloudData();
      await _client.rpc('delete_user');
      _log.info('Account deletion request sent for ${user.id}');
    } catch (e, s) {
      _log.severe('RPC or network error during account deletion', e, s);
      rethrow;
    }
  }
}
