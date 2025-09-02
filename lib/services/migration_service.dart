import 'package:hive_ce/hive.dart';
import 'package:logging/logging.dart';

import '../models/study_list.dart';

final _log = Logger('MigrationService');

Future<void> runMigrations() async {
  final settingsBox = Hive.box('settingsBox');
  const migrationKey = 'migration_v1.1.2_add_allow_substring';

  if (settingsBox.get(migrationKey) == true) {
    _log.fine("Migration '$migrationKey' already completed. Skipping.");
    return;
  }

  _log.info("Running migration: '$migrationKey'...");

  try {
    final studyListBox = Hive.box<StudyList>('studyListsBox');
    final Map<dynamic, StudyList> allLists = Map.from(studyListBox.toMap());

    if (allLists.isEmpty) {
      _log.info("No study lists found. Migration not needed.");
    } else {
      for (var entry in allLists.entries) {
        final key = entry.key;
        final list = entry.value;

        await studyListBox.put(key, list);
      }
      _log.info("Successfully migrated ${allLists.length} study lists.");
    }

    await settingsBox.put(migrationKey, true);
    _log.info("Migration '$migrationKey' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$migrationKey'", e, s);
  }
}
