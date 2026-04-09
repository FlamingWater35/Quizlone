import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import '../models/match_record.dart';
import '../models/settings_app_data.dart';
import '../models/study_group.dart';
import '../models/study_list.dart';
import '../models/term.dart';
import '../models/test_record.dart';
import '../providers/core/auth_provider.dart';

final _log = Logger("DatabaseService");

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
  static late Box<StudyGroup> _studyGroupBox;
  static const String _studyGroupBoxName = 'studyGroupsBox';
  static late Box<StudyList> _studyListBox;
  static const String _studyListBoxName = 'studyListsBox';
  static late Box<TestRecord> _testRecordsBox;
  static const String _testRecordsBoxName = 'testRecordsBox';

  static Future<void> init() async {
    await Hive.initFlutter('Quizlone');

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
  }

  Future<void> setApkPathForCleanup(String path) async {
    await _settingsBox.put(_apkCleanupPathKey, path);
  }

  String? getApkPathForCleanup() {
    return _settingsBox.get(_apkCleanupPathKey);
  }

  Future<void> clearApkPathForCleanup() async {
    await _settingsBox.delete(_apkCleanupPathKey);
  }

  Future<void> triggerCloudUpload() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _log.info("Offline mode: Skipping cloud upload trigger.");
      return;
    }

    _log.fine("Requesting a cloud sync from DatabaseService.");
    await ref.read(authControllerProvider.notifier).requestCloudSync();
  }

  Future<void> applyCloudData(AppData data) async {
    await _studyListBox.clear();
    await _matchRecordsBox.clear();
    await _studyGroupBox.clear();
    await _testRecordsBox.clear();

    for (final group in data.studyGroups) {
      await _studyGroupBox.put(group.id, group);
    }
    for (final list in data.studyLists) {
      await _studyListBox.put(list.id, list);
    }
    for (final record in data.matchRecords) {
      await _matchRecordsBox.add(record);
    }
    for (final record in data.testRecords) {
      await _testRecordsBox.put(record.id, record);
    }
  }

  Future<void> saveLastSyncTimestamp(DateTime timestamp) async {
    await _settingsBox.put(_lastSyncTimestampKey, timestamp.toIso8601String());
  }

  DateTime? getLastSyncTimestamp() {
    final timestampStr = _settingsBox.get(_lastSyncTimestampKey);
    if (timestampStr is String) {
      return DateTime.tryParse(timestampStr);
    }
    return null;
  }

  Future<void> saveMatchRecord(MatchRecord record) async {
    await _matchRecordsBox.add(record);
    await triggerCloudUpload();
  }

  Future<void> pruneMatchRecords(String studyListName) async {
    final allRecords = _matchRecordsBox.toMap();
    final List<MapEntry<dynamic, MatchRecord>> listRecords = [];

    allRecords.forEach((key, value) {
      if (value.studyListName == studyListName) {
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
  }

  Future<List<MatchRecord>> getRecordsForList(String studyListName) async {
    final records = _matchRecordsBox.values
        .where((r) => r.studyListName == studyListName)
        .toList();
    records.sort((a, b) => a.timeInTenths.compareTo(b.timeInTenths));
    return records;
  }

  Future<List<MatchRecord>> getAllMatchRecords() async {
    return _matchRecordsBox.values.toList();
  }

  Future<void> clearAllMatchRecords() async {
    await _matchRecordsBox.clear();
    await triggerCloudUpload();
  }

  Future<void> saveTestRecord(TestRecord record) async {
    await _testRecordsBox.put(record.id, record);
    await _pruneTestRecords(record.studyListId);
    await triggerCloudUpload();
  }

  Future<List<TestRecord>> getTestRecordsForList(String studyListId) async {
    final records = _testRecordsBox.values
        .where((r) => r.studyListId == studyListId)
        .toList();
    records.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return records;
  }

  Future<List<TestRecord>> getAllTestRecords() async {
    return _testRecordsBox.values.toList();
  }

  Future<TestRecord?> getLatestTestRecord(String studyListId) async {
    final records = await getTestRecordsForList(studyListId);
    return records.isNotEmpty ? records.first : null;
  }

  Future<void> clearAllUserData() async {
    _log.info("Clearing all user-specific local data.");
    await _studyListBox.clear();
    await _matchRecordsBox.clear();
    await _studyGroupBox.clear();
    await _testRecordsBox.clear();
    await _settingsBox.delete(_activeListIdKey);
    await _settingsBox.delete(_lastSyncTimestampKey);
  }

  Future<String> saveStudyList(StudyList list) async {
    await _box.put(list.id, list);
    await triggerCloudUpload();
    return list.id;
  }

  Future<bool> renameStudyList(String id, String newName) async {
    if (_box.values.any(
      (list) =>
          list.name.toLowerCase() == newName.toLowerCase() && list.id != id,
    )) {
      return false;
    }

    final listToRename = _box.get(id);
    if (listToRename == null) {
      return false;
    }

    final oldName = listToRename.name;
    final updatedList = listToRename.copyWith(
      name: newName,
      lastUsedAt: DateTime.now(),
    );
    await _box.put(id, updatedList);

    final Map<dynamic, MatchRecord> recordsToUpdate = {};
    final allRecords = _matchRecordsBox.toMap();
    allRecords.forEach((key, value) {
      if (value.studyListName == oldName) {
        recordsToUpdate[key] = value;
      }
    });

    if (recordsToUpdate.isNotEmpty) {
      for (var entry in recordsToUpdate.entries) {
        final oldRecord = entry.value;
        final newRecord = MatchRecord(
          studyListName: newName,
          timeInTenths: oldRecord.timeInTenths,
          createdAt: oldRecord.createdAt,
        );
        await _matchRecordsBox.put(entry.key, newRecord);
      }
    }

    await triggerCloudUpload();
    return true;
  }

  Future<List<StudyList>> getAllStudyLists() async {
    final allListsFromBox = _box.values.toList();
    allListsFromBox.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return allListsFromBox;
  }

  Stream<List<StudyList>> listenToStudyLists() {
    return _studyListBox.watch().asyncMap((_) {
      return getAllStudyLists();
    });
  }

  Future<StudyList?> getStudyListByName(String name) async {
    return _box.values.firstWhere((list) => list.name == name);
  }

  Future<StudyList?> getStudyListById(String id) async {
    return _box.get(id);
  }

  Future<bool> deleteStudyList(String id) async {
    if (_box.containsKey(id)) {
      final listToDelete = await getStudyListById(id);
      final listName = listToDelete?.name;

      await _box.delete(id);

      if (listName != null) {
        final List<dynamic> keysToDelete = [];
        final allRecords = _matchRecordsBox.toMap();
        allRecords.forEach((key, value) {
          if (value.studyListName == listName) {
            keysToDelete.add(key);
          }
        });
        if (keysToDelete.isNotEmpty) {
          await _matchRecordsBox.deleteAll(keysToDelete);
        }
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
  }

  Future<void> deleteStudyLists(List<String> ids) async {
    for (final id in ids) {
      await deleteStudyList(id);
    }
  }

  Future<void> deleteAllStudyLists() async {
    await _studyListBox.clear();
    await _testRecordsBox.clear();
    await triggerCloudUpload();
  }

  Future<void> saveTheme(String themeName) async {
    await _settingsBox.put('theme', themeName);
  }

  String getTheme() {
    return _settingsBox.get('theme', defaultValue: 'system');
  }

  Future<void> saveLanguage(String langCode) async {
    await _settingsBox.put('language', langCode);
  }

  String getLanguage() {
    return _settingsBox.get('language', defaultValue: 'system');
  }

  Future<void> saveUiScale(double scale) async {
    await _settingsBox.put('uiScale', scale);
  }

  double getUiScale() {
    return _settingsBox.get('uiScale', defaultValue: 1.0);
  }

  Future<void> saveActiveListId(String? id) async {
    if (id == null) {
      await _settingsBox.delete(_activeListIdKey);
    } else {
      await _settingsBox.put(_activeListIdKey, id);
    }
  }

  String? getActiveListId() {
    return _settingsBox.get(_activeListIdKey);
  }

  Future<void> saveStudyGroup(StudyGroup group) async {
    await _studyGroupBox.put(group.id, group);
    await triggerCloudUpload();
  }

  Future<List<StudyGroup>> getAllStudyGroups() async {
    final groups = _studyGroupBox.values.toList();
    groups.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return groups;
  }

  Stream<List<StudyGroup>> listenToStudyGroups() async* {
    yield await getAllStudyGroups();
    await for (final _ in _studyGroupBox.watch()) {
      yield await getAllStudyGroups();
    }
  }

  Future<void> deleteStudyGroup(String groupId) async {
    final listsToMove = _studyListBox.values
        .where((list) => list.groupId == groupId)
        .toList();
    for (final list in listsToMove) {
      list.groupId = null;
      await _studyListBox.put(list.id, list);
    }

    await _studyGroupBox.delete(groupId);
    await triggerCloudUpload();
  }

  Future<void> renameStudyGroup(String groupId, String newName) async {
    final group = _studyGroupBox.get(groupId);
    if (group != null) {
      group.name = newName;
      await _studyGroupBox.put(groupId, group);
      await triggerCloudUpload();
    }
  }

  Future<void> moveStudyListsToGroup(
    List<String> listIds,
    String? groupId,
  ) async {
    for (final listId in listIds) {
      final list = _studyListBox.get(listId);
      if (list != null) {
        list.groupId = groupId;
        await _studyListBox.put(listId, list);
      }
    }
    await triggerCloudUpload();
  }

  Future<void> _pruneTestRecords(String studyListId) async {
    final allRecords = _testRecordsBox.values
        .where((r) => r.studyListId == studyListId)
        .toList();

    if (allRecords.length > 20) {
      allRecords.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      final recordsToDelete = allRecords.sublist(20);
      final keysToDelete = recordsToDelete.map((r) => r.id).toList();

      await _testRecordsBox.deleteAll(keysToDelete);
    }
  }

  Box<StudyList> get _box => _studyListBox;
}
