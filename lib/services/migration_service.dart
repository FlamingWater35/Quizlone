import 'package:hive_ce/hive.dart';
import 'package:logging/logging.dart';

import '../models/study_list.dart';

final _log = Logger('MigrationService');

Future<void> runMigrations() async {
  await _migrateV112();
  await _migrateV1117();
}

const _migrationKeyV112 = 'migration_v1.1.2_add_allow_substring';

Future<void> _migrateV112() async {
  final settingsBox = Hive.box('settingsBox');

  if (settingsBox.get(_migrationKeyV112) == true) {
    return;
  }

  _log.info("Running migration: '$_migrationKeyV112'...");

  try {
    final studyListBox = Hive.box<StudyList>('studyListsBox');
    final Map<dynamic, StudyList> allLists = Map.from(studyListBox.toMap());

    if (allLists.isNotEmpty) {
      for (var entry in allLists.entries) {
        await studyListBox.put(entry.key, entry.value);
      }
      _log.info("Successfully migrated ${allLists.length} study lists.");
    }

    await settingsBox.put(_migrationKeyV112, true);
    _log.info("Migration '$_migrationKeyV112' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV112'", e, s);
  }
}

const _migrationKeyV1117 = 'migration_v1.1.17_remove_study_list_order';

Future<void> _migrateV1117() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV1117) == true) {
    return;
  }
  _log.info("Running migration: '$_migrationKeyV1117'...");
  try {
    const studyListOrderKey = 'studyListOrder';
    if (settingsBox.containsKey(studyListOrderKey)) {
      await settingsBox.delete(studyListOrderKey);
      _log.info("Successfully removed 'studyListOrder' key from settings.");
    } else {
      _log.info("'studyListOrder' key not found, skipping deletion.");
    }
    await settingsBox.put(_migrationKeyV1117, true);
    _log.info("Migration '$_migrationKeyV1117' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV1117'", e, s);
  }
}
