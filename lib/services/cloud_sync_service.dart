import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/settings_app_data.dart';
import '../providers/core/core_providers.dart';

final _log = Logger('CloudSyncService');

class CloudDataResponse {
  CloudDataResponse(this.data, this.timestamp);

  final AppData? data;
  final DateTime? timestamp;
}

class CloudSyncService {
  CloudSyncService(this.ref);

  final Ref ref;

  static const String _tableName = 'user_data';

  final SupabaseClient _client = Supabase.instance.client;

  Future<CloudDataResponse> getCloudData() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      return CloudDataResponse(null, null);
    }

    try {
      final response =
          await _client
              .from(_tableName)
              .select('data, last_updated_at')
              .eq('user_id', user.id)
              .single();

      final data =
          response['data'] != null
              ? AppData.fromJson(response['data'] as Map<String, dynamic>)
              : null;
      final timestamp =
          response['last_updated_at'] != null
              ? DateTime.parse(response['last_updated_at'] as String)
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
      _log.severe('Error downloading data from Supabase', e);
      rethrow;
    } catch (e, s) {
      _log.severe('An unexpected error occurred while downloading data', e, s);
      rethrow;
    }
  }

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
      });
      _log.fine('Successfully uploaded data for user ${user.id}.');
    } catch (e, s) {
      _log.severe('Error uploading data to Supabase', e, s);
      rethrow;
    }
  }

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
      _log.severe('Error deleting cloud data', e, s);
      rethrow;
    }
  }
}
