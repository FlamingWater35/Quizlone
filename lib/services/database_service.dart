import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizlone/services/migration_service.dart';

import '../models/match_record.dart';
import '../models/settings_app_data.dart';
import '../models/study_group.dart';
import '../models/study_list.dart';
import '../models/term.dart';
import '../models/test_record.dart';
import '../providers/core/auth_provider.dart';

final _log = Logger("DatabaseService");

/// Handles all local persistence using Hive and coordinates cloud sync triggers.
/// Centralizes DB operations to ensure consistent error handling and data integrity.
class DatabaseService {
  DatabaseService(this.ref);
  final Ref ref;

  static const String _activeListIdKey = 'activeListId';
  static const String _apkCleanupPathKey = 'apkCleanupPath';
  static const String _lastSyncTimestampKey = 'lastSyncTimestamp';

  static late Box<MatchRecord> _matchRecordsBox;
  static const String _matchRecordsBoxName = 'matchRecordsBox';

  static late Box _settingsBox;
  static const String _settingsBoxName = 'settingsBox';
  static const String _smoothScrollKey = 'smoothScrollEnabled';
  static const String _scrollSpeedKey = 'scrollSpeed';
  static const String _scrollDurationKey = 'scrollDuration';
  static const String _loadListSortOptionKey = 'loadListSortOption';
  static const String _loadListSortAscendingKey = 'loadListSortAscending';
  static const String _flashcardAnimationsDisabledKey =
      'flashcardAnimationsDisabled';

  static late Box<StudyGroup> _studyGroupBox;
  static const String _studyGroupBoxName = 'studyGroupsBox';

  static late Box<StudyList> _studyListBox;
  static const String _studyListBoxName = 'studyListsBox';

  static late Box<TestRecord> _testRecordsBox;
  static const String _testRecordsBoxName = 'testRecordsBox';

  /// Initializes Hive, registers adapters, and opens all required boxes.
  /// Must be called before any DB operations to prevent runtime crashes.
  static Future<void> init() async {
    try {
      if (kIsWeb) {
        await Hive.initFlutter('Quizlone');
      } else if (Platform.isAndroid || Platform.isIOS) {
        final dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
      } else {
        final dir = await getApplicationSupportDirectory();
        Hive.init(dir.path);
      }

      Hive.registerAdapter(TermAdapter());
      Hive.registerAdapter(StudyListAdapter());
      Hive.registerAdapter(MatchRecordAdapter());
      Hive.registerAdapter(StudyGroupAdapter());
      Hive.registerAdapter(TestRecordAdapter());
      Hive.registerAdapter(TestAnswerRecordAdapter());

      _studyListBox = await Hive.openBox<StudyList>(_studyListBoxName);
      _settingsBox = await Hive.openBox(_settingsBoxName);
      _matchRecordsBox = await Hive.openBox<MatchRecord>(_matchRecordsBoxName);
      _studyGroupBox = await Hive.openBox<StudyGroup>(_studyGroupBoxName);
      _testRecordsBox = await Hive.openBox<TestRecord>(_testRecordsBoxName);
    } catch (e, s) {
      _log.severe("Failed to initialize Hive database", e, s);
      rethrow; // Let main.dart catch and show fatal error screen
    }
  }

  /// Saves the downloaded APK path to clean it up on the next app launch.
  /// Prevents accumulation of old installer files on the user's device.
  Future<void> setApkPathForCleanup(String path) async {
    try {
      await _settingsBox.put(_apkCleanupPathKey, path);
    } catch (e, s) {
      _log.severe("Failed to save APK cleanup path", e, s);
    }
  }

  /// Retrieves the stored APK path that needs deletion on startup.
  /// Returns null if no cleanup is pending or if DB read fails.
  String? getApkPathForCleanup() {
    try {
      return _settingsBox.get(_apkCleanupPathKey);
    } catch (e, s) {
      _log.severe("Failed to read APK cleanup path", e, s);
      return null;
    }
  }

  /// Clears the pending APK cleanup flag after successful deletion.
  Future<void> clearApkPathForCleanup() async {
    try {
      await _settingsBox.delete(_apkCleanupPathKey);
    } catch (e, s) {
      _log.severe("Failed to clear APK cleanup path", e, s);
    }
  }

  /// Triggers a cloud sync if the device is online.
  /// Ensures local changes are backed up without blocking the UI thread.
  Future<void> triggerCloudUpload() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        _log.info("Offline mode: Skipping cloud upload trigger.");
        return;
      }
      _log.fine("Requesting a cloud sync from DatabaseService.");
      await ref.read(authControllerProvider.notifier).requestCloudSync();
    } catch (e, s) {
      _log.severe("Failed to trigger cloud upload", e, s);
    }
  }

  /// Overwrites local database with merged cloud data.
  /// Critical for resolving sync conflicts and ensuring cross-device consistency.
  Future<void> applyCloudData(AppData data) async {
    try {
      final localLists = await getAllStudyLists();
      final normalizedData = normalizeAppData(data, localLists);

      final oldListKeys = _studyListBox.keys.toSet();
      final oldGroupKeys = _studyGroupBox.keys.toSet();
      final oldTestKeys = _testRecordsBox.keys.toSet();

      if (normalizedData.studyGroups.isNotEmpty) {
        final groupMap = {for (var g in normalizedData.studyGroups) g.id: g};
        await _studyGroupBox.putAll(groupMap);
        oldGroupKeys.removeAll(groupMap.keys);
      }
      if (normalizedData.studyLists.isNotEmpty) {
        final listMap = {for (var l in normalizedData.studyLists) l.id: l};
        await _studyListBox.putAll(listMap);
        oldListKeys.removeAll(listMap.keys);
      }
      if (normalizedData.testRecords.isNotEmpty) {
        final testMap = {for (var t in normalizedData.testRecords) t.id: t};
        await _testRecordsBox.putAll(testMap);
        oldTestKeys.removeAll(testMap.keys);
      }

      await _matchRecordsBox.clear();
      await _matchRecordsBox.addAll(normalizedData.matchRecords);

      if (oldGroupKeys.isNotEmpty) await _studyGroupBox.deleteAll(oldGroupKeys);
      if (oldListKeys.isNotEmpty) await _studyListBox.deleteAll(oldListKeys);
      if (oldTestKeys.isNotEmpty) await _testRecordsBox.deleteAll(oldTestKeys);

      await runMigrations();
    } catch (e, s) {
      _log.severe("Critical failure applying cloud data to local DB", e, s);
      rethrow; // Caller needs to know sync failed to avoid false success states
    }
  }

  /// Persists the exact time of the last successful cloud synchronization.
  /// Used to determine if local or remote data is newer during merge conflicts.
  Future<void> saveLastSyncTimestamp(DateTime timestamp) async {
    try {
      await _settingsBox.put(
        _lastSyncTimestampKey,
        timestamp.toIso8601String(),
      );
    } catch (e, s) {
      _log.severe("Failed to save last sync timestamp", e, s);
    }
  }

  /// Retrieves the last sync timestamp to compare against cloud metadata.
  /// Returns null if the app has never synced or the setting is corrupted.
  DateTime? getLastSyncTimestamp() {
    try {
      final timestampStr = _settingsBox.get(_lastSyncTimestampKey);
      if (timestampStr is String) {
        return DateTime.tryParse(timestampStr);
      }
      return null;
    } catch (e, s) {
      _log.severe("Failed to read last sync timestamp", e, s);
      return null;
    }
  }

  /// Saves a new match game record and triggers a backup.
  /// Keeps local leaderboard data persistent and synced across devices.
  Future<void> saveMatchRecord(MatchRecord record) async {
    try {
      await _matchRecordsBox.add(record);
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to save match record", e, s);
    }
  }

  /// Limits the stored match records per list to 100 to prevent DB bloat.
  /// Deletes the slowest times first to preserve the user's best achievements.
  Future<void> pruneMatchRecords(String studyListId) async {
    try {
      final allRecords = _matchRecordsBox.toMap();
      final List<MapEntry<dynamic, MatchRecord>> listRecords = [];
      allRecords.forEach((key, value) {
        if (value.studyListId == studyListId) {
          listRecords.add(MapEntry(key, value));
        }
      });
      if (listRecords.length > 100) {
        listRecords.sort(
          (a, b) => a.value.timeInTenths.compareTo(b.value.timeInTenths),
        );
        final keysToDelete = listRecords
            .sublist(100)
            .map((entry) => entry.key)
            .toList();
        if (keysToDelete.isNotEmpty) {
          await _matchRecordsBox.deleteAll(keysToDelete);
        }
      }
    } catch (e, s) {
      _log.severe("Failed to prune match records", e, s);
    }
  }

  /// Fetches and sorts all match records for a specific study list by completion time.
  /// Provides the data source for the Match Leaderboard screen.
  Future<List<MatchRecord>> getRecordsForList(String studyListId) async {
    try {
      final records = _matchRecordsBox.values
          .where((r) => r.studyListId == studyListId)
          .toList();
      records.sort((a, b) => a.timeInTenths.compareTo(b.timeInTenths));
      return records;
    } catch (e, s) {
      _log.severe("Failed to get records for list: $studyListId", e, s);
      return [];
    }
  }

  /// Retrieves all match records across all lists for cloud backup serialization.
  Future<List<MatchRecord>> getAllMatchRecords() async {
    try {
      return _matchRecordsBox.values.toList();
    } catch (e, s) {
      _log.severe("Failed to get all match records", e, s);
      return [];
    }
  }

  /// Wipes all local match records, typically used during account deletion or data reset.
  Future<void> clearAllMatchRecords() async {
    try {
      await _matchRecordsBox.clear();
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to clear all match records", e, s);
    }
  }

  /// Saves a completed test record and prunes old history to save space.
  /// Ensures users can review past performance without infinite DB growth.
  Future<void> saveTestRecord(TestRecord record) async {
    try {
      await _testRecordsBox.put(record.id, record);
      await _pruneTestRecords(record.studyListId);
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to save test record", e, s);
    }
  }

  /// Fetches test history for a specific list, sorted by most recent first.
  /// Powers the Results Screen history dialog.
  Future<List<TestRecord>> getTestRecordsForList(String studyListId) async {
    try {
      final records = _testRecordsBox.values
          .where((r) => r.studyListId == studyListId)
          .toList();
      records.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return records;
    } catch (e, s) {
      _log.severe("Failed to get test records for list", e, s);
      return [];
    }
  }

  /// Retrieves all test records for full cloud backup serialization.
  Future<List<TestRecord>> getAllTestRecords() async {
    try {
      return _testRecordsBox.values.toList();
    } catch (e, s) {
      _log.severe("Failed to get all test records", e, s);
      return [];
    }
  }

  /// Grabs the single most recent test record for quick resume/review functionality.
  Future<TestRecord?> getLatestTestRecord(String studyListId) async {
    try {
      final records = await getTestRecordsForList(studyListId);
      return records.isNotEmpty ? records.first : null;
    } catch (e, s) {
      _log.severe("Failed to get latest test record", e, s);
      return null;
    }
  }

  /// Nukes all user-generated content and settings from the local device.
  /// Used when a user explicitly chooses to log out and wipe local data.
  Future<void> clearAllUserData() async {
    _log.info("Clearing all user-specific local data.");
    try {
      await _studyListBox.clear();
      await _matchRecordsBox.clear();
      await _studyGroupBox.clear();
      await _testRecordsBox.clear();
      await _settingsBox.delete(_activeListIdKey);
      await _settingsBox.delete(_lastSyncTimestampKey);
    } catch (e, s) {
      _log.severe("Failed to clear all user data", e, s);
    }
  }

  /// Persists a new or updated study list to the local database.
  /// Triggers a cloud sync to ensure cross-device availability.
  Future<String> saveStudyList(StudyList list) async {
    try {
      await _box.put(list.id, list);
      await triggerCloudUpload();
      return list.id;
    } catch (e, s) {
      _log.severe("Failed to save study list: ${list.name}", e, s);
      rethrow; // UI needs to catch this to show error snackbar
    }
  }

  /// Updates the display name of a study list while enforcing uniqueness.
  /// Returns false if the name is already taken to prevent UI confusion.
  Future<bool> renameStudyList(String id, String newName) async {
    try {
      if (_box.values.any(
        (list) =>
            list.name.toLowerCase() == newName.toLowerCase() && list.id != id,
      )) {
        return false;
      }
      final listToRename = _box.get(id);
      if (listToRename == null) return false;

      final updatedList = listToRename.copyWith(
        name: newName,
        lastUsedAt: DateTime.now(),
      );
      await _box.put(id, updatedList);
      await triggerCloudUpload();
      return true;
    } catch (e, s) {
      _log.severe("Failed to rename study list", e, s);
      return false;
    }
  }

  /// Retrieves all study lists sorted by creation date (newest first).
  /// Note: Sorting here is safe for small datasets, but consider UI-side sorting for 1000+ lists.
  Future<List<StudyList>> getAllStudyLists() async {
    try {
      final allListsFromBox = _box.values.toList();
      allListsFromBox.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return allListsFromBox;
    } catch (e, s) {
      _log.severe("Failed to get all study lists", e, s);
      return [];
    }
  }

  /// Creates a reactive stream that emits whenever the study list box changes.
  /// Keeps the UI automatically updated when lists are added, deleted, or modified.
  Stream<List<StudyList>> listenToStudyLists() {
    return _studyListBox.watch().asyncMap((_) async {
      try {
        return await getAllStudyLists();
      } catch (e, s) {
        _log.severe("Stream failed to fetch study lists", e, s);
        return [];
      }
    });
  }

  /// Retrieves a specific study list by its unique ID.
  /// Returns null if the list was deleted or DB read fails.
  Future<StudyList?> getStudyListById(String id) async {
    try {
      return _box.get(id);
    } catch (e, s) {
      _log.severe("Failed to fetch study list by ID: $id", e, s);
      return null;
    }
  }

  /// Deletes a study list and cascades deletion to its associated match/test records.
  /// Prevents orphaned records from cluttering the database and cloud backups.
  Future<bool> deleteStudyList(String id) async {
    try {
      if (_box.containsKey(id)) {
        await _box.delete(id);

        final List<dynamic> matchKeysToDelete = [];
        final allMatchRecords = _matchRecordsBox.toMap();
        allMatchRecords.forEach((key, value) {
          if (value.studyListId == id) matchKeysToDelete.add(key);
        });
        if (matchKeysToDelete.isNotEmpty) {
          await _matchRecordsBox.deleteAll(matchKeysToDelete);
        }

        final testRecordsToDelete = _testRecordsBox.values
            .where((r) => r.studyListId == id)
            .map((r) => r.id)
            .toList();
        if (testRecordsToDelete.isNotEmpty) {
          await _testRecordsBox.deleteAll(testRecordsToDelete);
        }

        await triggerCloudUpload();
        return true;
      }
      return false;
    } catch (e, s) {
      _log.severe("Failed to delete study list: $id", e, s);
      return false;
    }
  }

  /// Bulk deletes multiple study lists and their associated records.
  /// Used by the multi-select UI to quickly clean up the user's library.
  Future<void> deleteStudyLists(List<String> ids) async {
    for (final id in ids) {
      await deleteStudyList(id);
    }
  }

  /// Wipes all study lists and test records, usually triggered by a full data reset.
  Future<void> deleteAllStudyLists() async {
    try {
      await _studyListBox.clear();
      await _testRecordsBox.clear();
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to delete all study lists", e, s);
    }
  }

  /// Saves the user's preferred theme mode (light, dark, system) to persist across restarts.
  Future<void> saveTheme(String themeName) async {
    try {
      await _settingsBox.put('theme', themeName);
    } catch (e, s) {
      _log.severe("Failed to save theme", e, s);
    }
  }

  /// Reads the saved theme preference, defaulting to 'system' if unavailable.
  String getTheme() {
    try {
      return _settingsBox.get('theme', defaultValue: 'system');
    } catch (e, s) {
      _log.severe("Failed to read theme", e, s);
      return 'system';
    }
  }

  /// Saves the selected language code to override the device default locale.
  Future<void> saveLanguage(String langCode) async {
    try {
      await _settingsBox.put('language', langCode);
    } catch (e, s) {
      _log.severe("Failed to save language", e, s);
    }
  }

  /// Retrieves the saved language code for localization initialization.
  String getLanguage() {
    try {
      return _settingsBox.get('language', defaultValue: 'system');
    } catch (e, s) {
      _log.severe("Failed to read language", e, s);
      return 'system';
    }
  }

  /// Persists the global UI scale multiplier set by the user in accessibility settings.
  Future<void> saveUiScale(double scale) async {
    try {
      await _settingsBox.put('uiScale', scale);
    } catch (e, s) {
      _log.severe("Failed to save UI scale", e, s);
    }
  }

  /// Retrieves the UI scale multiplier, defaulting to 1.0 (100%).
  double getUiScale() {
    try {
      return _settingsBox.get('uiScale', defaultValue: 1.0);
    } catch (e, s) {
      _log.severe("Failed to read UI scale", e, s);
      return 1.0;
    }
  }

  /// Toggles the custom smooth scrolling physics globally across the app.
  Future<void> saveSmoothScroll(bool enabled) async {
    try {
      await _settingsBox.put(_smoothScrollKey, enabled);
    } catch (e, s) {
      _log.severe("Failed to save smooth scroll setting", e, s);
    }
  }

  /// Checks if the user prefers custom smooth scrolling over native physics.
  bool getSmoothScroll() {
    try {
      return _settingsBox.get(_smoothScrollKey, defaultValue: false);
    } catch (e, s) {
      _log.severe("Failed to read smooth scroll setting", e, s);
      return false;
    }
  }

  /// Saves the silky_scroll pointer scroll speed multiplier.
  Future<void> saveScrollSpeed(double value) async {
    try {
      await _settingsBox.put(_scrollSpeedKey, value);
    } catch (e, s) {
      _log.severe("Failed to save scroll speed", e, s);
    }
  }

  /// Returns the silky_scroll pointer scroll speed (default 1.1).
  double getScrollSpeed() {
    try {
      return _settingsBox.get(_scrollSpeedKey, defaultValue: 1.1);
    } catch (e, s) {
      _log.severe("Failed to read scroll speed", e, s);
      return 1.1;
    }
  }

  /// Saves the silky_scroll scroll animation duration in milliseconds.
  Future<void> saveScrollDuration(int value) async {
    try {
      await _settingsBox.put(_scrollDurationKey, value);
    } catch (e, s) {
      _log.severe("Failed to save scroll duration", e, s);
    }
  }

  /// Returns the silky_scroll scroll duration in ms (default 1400).
  int getScrollDuration() {
    try {
      return _settingsBox.get(_scrollDurationKey, defaultValue: 1400);
    } catch (e, s) {
      _log.severe("Failed to read scroll duration", e, s);
      return 1400;
    }
  }

  /// Persists whether flashcard flip/transition animations are disabled.
  Future<void> saveFlashcardAnimationsDisabled(bool disabled) async {
    try {
      await _settingsBox.put(_flashcardAnimationsDisabledKey, disabled);
    } catch (e, s) {
      _log.severe("Failed to save flashcard animations setting", e, s);
    }
  }

  /// Returns true when the user has disabled flashcard animations.
  bool getFlashcardAnimationsDisabled() {
    try {
      return _settingsBox.get(
        _flashcardAnimationsDisabledKey,
        defaultValue: false,
      );
    } catch (e, s) {
      _log.severe("Failed to read flashcard animations setting", e, s);
      return false;
    }
  }

  /// Saves the chosen sort option name for the load list screen.
  Future<void> saveLoadListSortOption(String option) async {
    try {
      await _settingsBox.put(_loadListSortOptionKey, option);
    } catch (e, s) {
      _log.severe("Failed to save load list sort option", e, s);
    }
  }

  /// Returns the saved sort option name (defaults to "createdAt").
  String getLoadListSortOption() {
    try {
      return _settingsBox.get(
        _loadListSortOptionKey,
        defaultValue: 'createdAt',
      );
    } catch (e, s) {
      _log.severe("Failed to read load list sort option", e, s);
      return 'createdAt';
    }
  }

  /// Saves the sort direction for the load list screen.
  Future<void> saveLoadListSortAscending(bool ascending) async {
    try {
      await _settingsBox.put(_loadListSortAscendingKey, ascending);
    } catch (e, s) {
      _log.severe("Failed to save load list sort direction", e, s);
    }
  }

  /// Returns the saved sort direction (defaults to false = descending).
  bool getLoadListSortAscending() {
    try {
      return _settingsBox.get(
        _loadListSortAscendingKey,
        defaultValue: false,
      );
    } catch (e, s) {
      _log.severe("Failed to read load list sort direction", e, s);
      return false;
    }
  }

  /// Remembers which study list the user was last interacting with.
  /// Allows the app to deep-link directly to the Mode Selection screen on startup.
  Future<void> saveActiveListId(String? id) async {
    try {
      if (id == null) {
        await _settingsBox.delete(_activeListIdKey);
      } else {
        await _settingsBox.put(_activeListIdKey, id);
      }
    } catch (e, s) {
      _log.severe("Failed to save active list ID", e, s);
    }
  }

  /// Retrieves the ID of the currently active study list.
  String? getActiveListId() {
    try {
      return _settingsBox.get(_activeListIdKey);
    } catch (e, s) {
      _log.severe("Failed to read active list ID", e, s);
      return null;
    }
  }

  /// Creates a new folder/group to organize study lists in the library view.
  Future<void> saveStudyGroup(StudyGroup group) async {
    try {
      await _studyGroupBox.put(group.id, group);
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to save study group", e, s);
    }
  }

  /// Fetches all groups sorted alphabetically for the UI dropdowns and library view.
  Future<List<StudyGroup>> getAllStudyGroups() async {
    try {
      final groups = _studyGroupBox.values.toList();
      groups.sort((a, b) => a.name.compareTo(b.name));
      return groups;
    } catch (e, s) {
      _log.severe("Failed to get all study groups", e, s);
      return [];
    }
  }

  /// Provides a reactive stream of study groups to update the UI when folders are added/renamed.
  Stream<List<StudyGroup>> listenToStudyGroups() async* {
    yield await getAllStudyGroups();
    try {
      await for (final _ in _studyGroupBox.watch()) {
        yield await getAllStudyGroups();
      }
    } catch (e, s) {
      _log.severe("Stream failed to fetch study groups", e, s);
    }
  }

  /// Deletes a group and moves all its contained lists to the "Ungrouped" state.
  /// Prevents lists from becoming inaccessible if their parent folder is removed.
  Future<void> deleteStudyGroup(String groupId) async {
    try {
      final listsToMove = _studyListBox.values
          .where((list) => list.groupId == groupId)
          .toList();
      for (final list in listsToMove) {
        list.groupId = null;
        await _studyListBox.put(list.id, list);
      }
      await _studyGroupBox.delete(groupId);
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to delete study group", e, s);
    }
  }

  /// Updates the display name of an existing study group folder.
  Future<void> renameStudyGroup(String groupId, String newName) async {
    try {
      final group = _studyGroupBox.get(groupId);
      if (group != null) {
        group.name = newName;
        await _studyGroupBox.put(groupId, group);
        await triggerCloudUpload();
      }
    } catch (e, s) {
      _log.severe("Failed to rename study group", e, s);
    }
  }

  /// Moves a batch of study lists into a specific group or out to "Ungrouped".
  /// Used by the multi-select bulk-move feature in the library screen.
  Future<void> moveStudyListsToGroup(
    List<String> listIds,
    String? groupId,
  ) async {
    try {
      for (final listId in listIds) {
        final list = _studyListBox.get(listId);
        if (list != null) {
          list.groupId = groupId;
          await _studyListBox.put(listId, list);
        }
      }
      await triggerCloudUpload();
    } catch (e, s) {
      _log.severe("Failed to move study lists to group", e, s);
    }
  }

  /// Limits stored test history per list to 20 records to prevent DB bloat.
  /// Deletes the oldest records first to preserve recent performance data.
  Future<void> _pruneTestRecords(String studyListId) async {
    try {
      final allRecords = _testRecordsBox.values
          .where((r) => r.studyListId == studyListId)
          .toList();
      if (allRecords.length > 20) {
        allRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        final recordsToDelete = allRecords.sublist(20);
        final keysToDelete = recordsToDelete.map((r) => r.id).toList();
        await _testRecordsBox.deleteAll(keysToDelete);
      }
    } catch (e, s) {
      _log.severe("Failed to prune test records", e, s);
    }
  }

  /// Convenience getter to access the main study list box cleanly.
  Box<StudyList> get _box => _studyListBox;
}
