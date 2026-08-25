import 'package:hive_ce/hive.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/models/settings_app_data.dart';

import '../models/study_list.dart';

final _log = Logger('MigrationService');

/// Executes all pending database schema migrations sequentially.
/// Ensures backward compatibility when users upgrade from older app versions.
Future<void> runMigrations() async {
  await _migrateV112();
  await _migrateV1117();
  await _migrateV124();
  await _migrateV1215();
}

const _migrationKeyV112 = 'migration_v1.1.2_add_allow_substring';

/// Migrates existing StudyList objects to include the new `allowAnswerSubstring` field.
/// Prevents null reference errors when older lists are loaded into the new schema.
Future<void> _migrateV112() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV112) == true) return;

  _log.info("Running migration: '$_migrationKeyV112'...");
  try {
    final studyListBox = Hive.box<StudyList>('studyListsBox');
    final Map<dynamic, StudyList> allLists = Map.from(studyListBox.toMap());

    if (allLists.isNotEmpty) {
      // Re-saving forces Hive to apply the new default values for missing fields.
      for (var entry in allLists.entries) {
        await studyListBox.put(entry.key, entry.value);
      }
      _log.info("Successfully migrated ${allLists.length} study lists.");
    }
    await settingsBox.put(_migrationKeyV112, true);
    _log.info("Migration '$_migrationKeyV112' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV112'", e, s);
    // Do not rethrow; allow app to start with potentially degraded functionality rather than crashing.
  }
}

const _migrationKeyV1117 = 'migration_v1.1.17_remove_study_list_order';

/// Removes the deprecated `studyListOrder` key from settings.
/// Cleans up legacy data that is no longer used by the new sorting logic, preventing DB bloat.
Future<void> _migrateV1117() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV1117) == true) return;

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

const _migrationKeyV1118 = 'migration_v1.1.18_match_record_id';

/// Migrates MatchRecord `studyListId` fields from legacy string names to UUIDs.
/// Critical for preventing data orphaning when users rename study lists.
Future<void> _migrateV124() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV1118) == true) return;

  _log.info(
    "Running migration: '$_migrationKeyV1118' (Names to IDs in MatchRecords)...",
  );
  try {
    final studyListBox = Hive.box<StudyList>('studyListsBox');
    final matchRecordsBox = Hive.box<MatchRecord>('matchRecordsBox');

    // Build a lookup map to resolve old names to new UUIDs.
    final nameToIdMap = <String, String>{};
    for (var list in studyListBox.values) {
      nameToIdMap[list.name] = list.id;
    }

    final recordsMap = matchRecordsBox.toMap();
    int migratedCount = 0;

    for (var entry in recordsMap.entries) {
      final record = entry.value;
      final oldNameValue = record.studyListId;

      if (nameToIdMap.containsKey(oldNameValue)) {
        final actualId = nameToIdMap[oldNameValue]!;
        final updatedRecord = MatchRecord(
          studyListId: actualId,
          timeInTenths: record.timeInTenths,
          createdAt: record.createdAt,
        );
        await matchRecordsBox.put(entry.key, updatedRecord);
        migratedCount++;
      }
    }

    await settingsBox.put(_migrationKeyV1118, true);
    _log.info(
      "Migration completed. Successfully updated $migratedCount match records.",
    );
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV1118'", e, s);
  }
}

const _migrationKeyV1215 = 'migration_v1.2.15_add_ignore_brackets';

/// Migrates existing StudyList objects to include the new `ignoreBrackets` field.
/// Re-saving forces Hive to apply the new default values for missing fields.
Future<void> _migrateV1215() async {
  final settingsBox = Hive.box('settingsBox');
  if (settingsBox.get(_migrationKeyV1215) == true) return;
  _log.info("Running migration: '$_migrationKeyV1215'...");
  try {
    final studyListBox = Hive.box<StudyList>('studyListsBox');
    final Map<dynamic, StudyList> allLists = Map.from(studyListBox.toMap());
    if (allLists.isNotEmpty) {
      for (var entry in allLists.entries) {
        await studyListBox.put(entry.key, entry.value);
      }
      _log.info("Successfully migrated ${allLists.length} study lists.");
    }
    await settingsBox.put(_migrationKeyV1215, true);
    _log.info("Migration '$_migrationKeyV1215' completed and flag set.");
  } catch (e, s) {
    _log.severe("Error during migration '$_migrationKeyV1215'", e, s);
  }
}

/// Converts legacy MatchRecord studyListId strings (names) to UUIDs using the provided study lists.
/// This is critical for cloud sync and imports, where data might bypass local startup migrations.
List<MatchRecord> normalizeMatchRecords(List<MatchRecord> records, List<StudyList> lists) {
  final nameToIdMap = <String, String>{};
  for (var list in lists) {
    if (list.name.isNotEmpty) {
      nameToIdMap[list.name] = list.id;
    }
  }

  return records.map((record) {
    if (nameToIdMap.containsKey(record.studyListId)) {
      return MatchRecord(
        studyListId: nameToIdMap[record.studyListId]!,
        timeInTenths: record.timeInTenths,
        createdAt: record.createdAt,
      );
    }
    return record;
  }).toList();
}

/// Normalizes an AppData object to ensure all legacy data conforms to the current schema.
AppData normalizeAppData(AppData data, List<StudyList> localLists) {
  final combinedLists = [...localLists, ...data.studyLists];
  final normalizedRecords = normalizeMatchRecords(data.matchRecords, combinedLists);

  return data.copyWith(matchRecords: normalizedRecords);
}
