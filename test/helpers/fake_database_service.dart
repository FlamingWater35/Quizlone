import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/models/settings_app_data.dart';
import 'package:quizlone/models/study_group.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:quizlone/services/database_service.dart';

/// In-memory [DatabaseService] replacement used by controller/provider tests.
///
/// It mirrors the storage semantics of the real Hive-backed service well enough
/// to exercise controllers (CRUD, renaming, pruning, ordering) without touching
/// platform channels or the filesystem.
class FakeDatabaseService implements DatabaseService {
  FakeDatabaseService();

  // The real service only uses `ref` for cloud-sync triggers, which this fake
  // overrides, so a throwing stub is sufficient.
  @override
  late final Ref ref = (throw UnimplementedError(
    'FakeDatabaseService.ref is not used because triggerCloudUpload is overridden.',
  ));

  final Map<String, StudyList> studyLists = {};
  final Map<String, MatchRecord> matchRecords = {};
  final Map<String, StudyGroup> studyGroups = {};
  final Map<String, TestRecord> testRecords = {};
  final Map<String, Object> settings = {};

  /// When set to `true`, mutating calls throw immediately (simulates DB failure).
  bool failOnWrite = false;

  /// Track how many times a cloud upload was triggered.
  int cloudUploadTriggerCount = 0;

  /// Track calls to pruneMatchRecords (list id -> count).
  final Map<String, int> pruneCalls = {};

  @override
  Future<void> triggerCloudUpload() async {
    cloudUploadTriggerCount++;
  }

  // --- Study lists ---

  @override
  Future<List<StudyList>> getAllStudyLists() async {
    final lists = studyLists.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return lists;
  }

  @override
  Future<StudyList?> getStudyListById(String id) async => studyLists[id];

  @override
  Future<String> saveStudyList(StudyList list) async {
    if (failOnWrite) throw StateError('Simulated DB failure');
    studyLists[list.id] = list;
    await triggerCloudUpload();
    return list.id;
  }

  @override
  Future<bool> renameStudyList(String id, String newName) async {
    if (failOnWrite) return false;
    if (studyLists.values.any(
      (list) => list.name.toLowerCase() == newName.toLowerCase() && list.id != id,
    )) {
      return false;
    }
    final list = studyLists[id];
    if (list == null) return false;
    studyLists[id] = list.copyWith(name: newName, lastUsedAt: DateTime.now());
    await triggerCloudUpload();
    return true;
  }

  @override
  Future<bool> deleteStudyList(String id) async {
    if (failOnWrite) return false;
    if (!studyLists.containsKey(id)) return false;
    studyLists.remove(id);
    matchRecords.removeWhere((_, r) => r.studyListId == id);
    testRecords.removeWhere((_, r) => r.studyListId == id);
    await triggerCloudUpload();
    return true;
  }

  @override
  Future<void> deleteStudyLists(List<String> ids) async {
    for (final id in ids) {
      await deleteStudyList(id);
    }
  }

  @override
  Future<void> deleteAllStudyLists() async {
    studyLists.clear();
    testRecords.clear();
    await triggerCloudUpload();
  }

  @override
  Stream<List<StudyList>> listenToStudyLists() async* {
    yield await getAllStudyLists();
  }

  // --- Match records ---

  @override
  Future<void> saveMatchRecord(MatchRecord record) async {
    if (failOnWrite) throw StateError('Simulated DB failure');
    matchRecords[record.studyListId + record.createdAt.toIso8601String()] = record;
    await triggerCloudUpload();
  }

  @override
  Future<List<MatchRecord>> getRecordsForList(String studyListId) async {
    final records = matchRecords.values
        .where((r) => r.studyListId == studyListId)
        .toList()
      ..sort((a, b) => a.timeInTenths.compareTo(b.timeInTenths));
    return records;
  }

  @override
  Future<List<MatchRecord>> getAllMatchRecords() async =>
      matchRecords.values.toList();

  @override
  Future<void> clearAllMatchRecords() async {
    matchRecords.clear();
    await triggerCloudUpload();
  }

  @override
  Future<void> pruneMatchRecords(String studyListId) async {
    pruneCalls[studyListId] = (pruneCalls[studyListId] ?? 0) + 1;
    final records = matchRecords.entries
        .where((e) => e.value.studyListId == studyListId)
        .toList()
      ..sort((a, b) => a.value.timeInTenths.compareTo(b.value.timeInTenths));
    if (records.length > 100) {
      for (final entry in records.sublist(100)) {
        matchRecords.remove(entry.key);
      }
    }
  }

  // --- Test records ---

  @override
  Future<void> saveTestRecord(TestRecord record) async {
    if (failOnWrite) throw StateError('Simulated DB failure');
    testRecords[record.id] = record;
    await triggerCloudUpload();
  }

  @override
  Future<List<TestRecord>> getTestRecordsForList(String studyListId) async {
    final records = testRecords.values
        .where((r) => r.studyListId == studyListId)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return records;
  }

  @override
  Future<List<TestRecord>> getAllTestRecords() async =>
      testRecords.values.toList();

  @override
  Future<TestRecord?> getLatestTestRecord(String studyListId) async {
    final records = await getTestRecordsForList(studyListId);
    return records.isNotEmpty ? records.first : null;
  }

  // --- Groups ---

  @override
  Future<void> saveStudyGroup(StudyGroup group) async {
    if (failOnWrite) throw StateError('Simulated DB failure');
    studyGroups[group.id] = group;
    await triggerCloudUpload();
  }

  @override
  Future<List<StudyGroup>> getAllStudyGroups() async {
    final groups = studyGroups.values.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    return groups;
  }

  @override
  Stream<List<StudyGroup>> listenToStudyGroups() async* {
    yield await getAllStudyGroups();
  }

  @override
  Future<void> deleteStudyGroup(String groupId) async {
    if (failOnWrite) return;
    for (final list in studyLists.values) {
      if (list.groupId == groupId) {
        studyLists[list.id] = list.copyWith(groupId: null);
      }
    }
    studyGroups.remove(groupId);
    await triggerCloudUpload();
  }

  @override
  Future<void> renameStudyGroup(String groupId, String newName) async {
    if (failOnWrite) return;
    final group = studyGroups[groupId];
    if (group != null) {
      studyGroups[groupId] = StudyGroup(
        name: newName,
        id: group.id,
        createdAt: group.createdAt,
      );
      await triggerCloudUpload();
    }
  }

  @override
  Future<void> moveStudyListsToGroup(
    List<String> listIds,
    String? groupId,
  ) async {
    if (failOnWrite) return;
    for (final listId in listIds) {
      final list = studyLists[listId];
      if (list != null) {
        studyLists[listId] = list.copyWith(groupId: groupId);
      }
    }
    await triggerCloudUpload();
  }

  // --- Cloud data ---

  @override
  Future<void> applyCloudData(AppData data) async {
    if (failOnWrite) throw StateError('Simulated DB failure');
    for (final group in data.studyGroups) {
      studyGroups[group.id] = group;
    }
    for (final list in data.studyLists) {
      studyLists[list.id] = list;
    }
    for (final test in data.testRecords) {
      testRecords[test.id] = test;
    }
    matchRecords.clear();
    for (final record in data.matchRecords) {
      matchRecords[record.studyListId + record.createdAt.toIso8601String()] =
          record;
    }
  }

  @override
  Future<void> saveLastSyncTimestamp(DateTime timestamp) async {
    settings['lastSyncTimestamp'] = timestamp.toIso8601String();
  }

  @override
  DateTime? getLastSyncTimestamp() {
    final value = settings['lastSyncTimestamp'];
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  @override
  Future<void> clearAllUserData() async {
    studyLists.clear();
    matchRecords.clear();
    studyGroups.clear();
    testRecords.clear();
    settings.remove('activeListId');
    settings.remove('lastSyncTimestamp');
  }

  // --- Settings ---

  @override
  Future<void> saveTheme(String themeName) async {
    settings['theme'] = themeName;
  }

  @override
  String getTheme() => settings['theme'] as String? ?? 'system';

  @override
  Future<void> saveLanguage(String langCode) async {
    settings['language'] = langCode;
  }

  @override
  String getLanguage() => settings['language'] as String? ?? 'system';

  @override
  Future<void> saveUiScale(double scale) async {
    settings['uiScale'] = scale;
  }

  @override
  double getUiScale() => settings['uiScale'] as double? ?? 1.0;

  @override
  Future<void> saveSmoothScroll(bool enabled) async {
    settings['smoothScrollEnabled'] = enabled;
  }

  @override
  bool getSmoothScroll() => settings['smoothScrollEnabled'] as bool? ?? false;

  @override
  Future<void> saveScrollSpeed(double value) async {
    settings['scrollSpeed'] = value;
  }

  @override
  double getScrollSpeed() => settings['scrollSpeed'] as double? ?? 1.1;

  @override
  Future<void> saveScrollDuration(int value) async {
    settings['scrollDuration'] = value;
  }

  @override
  int getScrollDuration() => settings['scrollDuration'] as int? ?? 1400;

  @override
  Future<void> saveActiveListId(String? id) async {
    if (id == null) {
      settings.remove('activeListId');
    } else {
      settings['activeListId'] = id;
    }
  }

  @override
  String? getActiveListId() => settings['activeListId'] as String?;

  // --- APK cleanup ---

  @override
  Future<void> setApkPathForCleanup(String path) async {
    settings['apkCleanupPath'] = path;
  }

  @override
  String? getApkPathForCleanup() => settings['apkCleanupPath'] as String?;

  @override
  Future<void> clearApkPathForCleanup() async {
    settings.remove('apkCleanupPath');
  }

  /// Convenience: registers this fake as the [databaseServiceProvider] override.
  static dynamic asOverride(FakeDatabaseService fake) {
    return databaseServiceProvider.overrideWithValue(fake);
  }
}
