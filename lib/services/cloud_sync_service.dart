import 'dart:async';

import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/settings_app_data.dart';

final _log = Logger('CloudSyncService');

class CloudSyncService {
  static const String _tableName = 'user_data';

  final SupabaseClient _client = Supabase.instance.client;

  Future<AppData?> downloadData() async {
    final user = _client.auth.currentUser;
    if (user == null) {
      _log.info('No user logged in, cannot download data.');
      return null;
    }

    try {
      final response =
          await _client
              .from(_tableName)
              .select('data')
              .eq('user_id', user.id)
              .single();

      if (response['data'] == null) {
        _log.info('No cloud data found for user ${user.id}.');
        return null;
      }

      _log.fine('Successfully downloaded data for user ${user.id}.');
      return AppData.fromJson(response['data'] as Map<String, dynamic>);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        _log.info('No cloud data found for user ${user.id}.');
        return null;
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
      final jsonData = data.toJson();
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
