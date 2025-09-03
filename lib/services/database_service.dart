import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/match_record.dart';
import '../models/settings_app_data.dart';
import '../models/study_list.dart';
import '../models/term.dart';
import '../providers/core/core_providers.dart';

class DatabaseService {
  DatabaseService(this.ref);

  final Ref ref;

  static const String _activeListIdKey = 'activeListId';
  static const String _lastSyncTimestampKey = 'lastSyncTimestamp';
  static late Box<MatchRecord> _matchRecordsBox;
  static const String _matchRecordsBoxName = 'matchRecordsBox';
  static late Box _settingsBox;
  static const String _settingsBoxName = 'settingsBox';
  static late Box<StudyList> _studyListBox;
  static const String _studyListBoxName = 'studyListsBox';
  static const String _studyListOrderKey = 'studyListOrder';

  static Future<void> init() async {
    await Hive.initFlutter('Quizlone');

    Hive.registerAdapter(TermAdapter());
    Hive.registerAdapter(StudyListAdapter());
    Hive.registerAdapter(MatchRecordAdapter());

    _studyListBox = await Hive.openBox<StudyList>(_studyListBoxName);
    _settingsBox = await Hive.openBox(_settingsBoxName);
    _matchRecordsBox = await Hive.openBox<MatchRecord>(_matchRecordsBoxName);
  }

  Future<void> triggerCloudUpload() async {
    final lists = await getAllStudyLists();
    final records = await getAllMatchRecords();
    final order = getStudyListOrder();

    final appData = AppData(
      studyLists: lists,
      matchRecords: records,
      studyListOrder: order,
    );
    await ref.read(cloudSyncServiceProvider).uploadData(appData);
    await saveLastSyncTimestamp(DateTime.now().toUtc());
  }

  Future<void> applyCloudData(AppData data) async {
    await _studyListBox.clear();
    await _matchRecordsBox.clear();

    for (final list in data.studyLists) {
      await _studyListBox.put(list.id, list);
    }
    for (final record in data.matchRecords) {
      await _matchRecordsBox.add(record);
    }
    await _saveStudyListOrderSilently(data.studyListOrder);
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
      final keysToDelete =
          listRecords.sublist(100).map((entry) => entry.key).toList();
      if (keysToDelete.isNotEmpty) {
        await _matchRecordsBox.deleteAll(keysToDelete);
      }
    }
  }

  Future<List<MatchRecord>> getRecordsForList(String studyListName) async {
    final records =
        _matchRecordsBox.values
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

  Future<void> saveStudyListOrder(List<String> order) async {
    await _settingsBox.put(_studyListOrderKey, order);
    await triggerCloudUpload();
  }

  List<String> getStudyListOrder() {
    final order = _settingsBox.get(_studyListOrderKey);
    if (order is List) {
      return order.cast<String>();
    }
    return [];
  }

  Future<String> saveStudyList(StudyList list) async {
    final isNew = !_box.containsKey(list.id);
    await _box.put(list.id, list);

    if (isNew) {
      await saveStudyListOrder(getStudyListOrder());
    } else {
      await triggerCloudUpload();
    }
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
    if (allListsFromBox.isEmpty) {
      return [];
    }

    var order = getStudyListOrder();
    final listMap = {for (var list in allListsFromBox) list.id: list};

    final originalOrderLength = order.length;
    order.removeWhere((key) => !listMap.containsKey(key));

    final Set<String> orderKeys = order.toSet();
    final List<String> newKeys =
        listMap.keys.where((key) => !orderKeys.contains(key)).toList();

    if (newKeys.isNotEmpty) {
      order.insertAll(0, newKeys);
    }

    if (newKeys.isNotEmpty || order.length != originalOrderLength) {
      await _saveStudyListOrderSilently(order);
    }

    return order.map((key) => listMap[key]!).whereType<StudyList>().toList();
  }

  Stream<List<StudyList>> listenToStudyLists() {
    final listChanges = _studyListBox.watch();
    final orderChanges = _settingsBox.watch(key: _studyListOrderKey);

    return StreamGroup.merge([listChanges, orderChanges]).asyncMap((_) {
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
      final order = getStudyListOrder();
      order.remove(id);

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

      await saveStudyListOrder(order);

      return true;
    }
    return false;
  }

  Future<void> deleteAllStudyLists() async {
    await _studyListBox.clear();
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

  Future<void> _saveStudyListOrderSilently(List<String> order) async {
    await _settingsBox.put(_studyListOrderKey, order);
  }

  Box<StudyList> get _box => _studyListBox;
}
