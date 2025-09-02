import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/services/cloud_sync_service.dart';
import '/services/database_service.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
DatabaseService databaseService(Ref ref) {
  return DatabaseService(ref);
}

@riverpod
CloudSyncService cloudSyncService(Ref ref) {
  return CloudSyncService();
}
