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

const _migrationKeyV1117 = 'migration_v1.1.17_add_groups';

Future<void> _migrateV1117() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV1117) == true) {
    return;
  }
  _log.info("Running migration: '$_migrationKeyV1117'...");
  try {
    _log.info(
      "Registering StudyGroupAdapter is handled at startup. Migration logic is passive.",
    );
    await settingsBox.put(_migrationKeyV1117, true);
    _log.info("Migration '$_migrationKeyV1117' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV1117'", e, s);
  }
}
