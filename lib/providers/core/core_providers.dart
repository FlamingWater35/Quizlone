import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/services/database_service.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
DatabaseService databaseService(DatabaseServiceRef ref) {
  return DatabaseService();
}
