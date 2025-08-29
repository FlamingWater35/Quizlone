import 'dart:collection';

import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/match_record.dart';
import '../models/study_list.dart';
import '../models/term.dart';

class DatabaseService {
  DatabaseService();

  static const String _activeListIdKey = 'activeListId';
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

  Future<void> saveMatchRecord(MatchRecord record) async {
    await _matchRecordsBox.add(record);
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
  }

  Future<void> saveStudyListOrder(List<String> order) async {
    await _settingsBox.put(_studyListOrderKey, order);
  }

  List<String> getStudyListOrder() {
    final order = _settingsBox.get(_studyListOrderKey);
    if (order is List) {
      return order.cast<String>();
    }
    return [];
  }

  Future<String> saveStudyList(StudyList list) async {
    final isNew = !_box.containsKey(list.name);
    await _box.put(list.name, list);
    if (isNew) {
      final order = getStudyListOrder();
      order.insert(0, list.name);
      await saveStudyListOrder(order);
    }
    return list.name;
  }

  Future<bool> renameStudyList(String oldNameKey, String newName) async {
    if (_box.containsKey(newName)) {
      return false;
    }

    final listToRename = _box.get(oldNameKey);
    if (listToRename == null) {
      return false;
    }

    final updatedList =
        StudyList()
          ..name = newName
          ..terms = listToRename.terms
          ..createdAt = listToRename.createdAt
          ..lastUsedAt = DateTime.now()
          ..lastOpenedAt = listToRename.lastOpenedAt
          ..flashcardShowTermFirst = listToRename.flashcardShowTermFirst
          ..studyShowDefinitionAskTerm = listToRename.studyShowDefinitionAskTerm
          ..testStudyLength = listToRename.testStudyLength
          ..testFormat = listToRename.testFormat;

    await _box.put(newName, updatedList);
    await _box.delete(oldNameKey);

    final order = getStudyListOrder();
    final index = order.indexOf(oldNameKey);
    if (index != -1) {
      order[index] = newName;
      await saveStudyListOrder(order);
    }

    return true;
  }

  Future<List<StudyList>> getAllStudyLists() async {
    final allListsFromBox = _box.values.toList();
    if (allListsFromBox.isEmpty) {
      return [];
    }

    var order = getStudyListOrder();
    final listMap = {for (var list in allListsFromBox) list.name: list};
    return order.map((key) => listMap[key]).whereType<StudyList>().toList();
  }

  Stream<List<StudyList>> listenToStudyLists() async* {
    List<StudyList> getSortedLists() {
      final allListsFromBox = _box.values.toList();
      if (allListsFromBox.isEmpty) {
        saveStudyListOrder([]);
        return [];
      }

      var order = getStudyListOrder();
      final listMap = {for (var list in allListsFromBox) list.name: list};
      final Set<String> boxKeys = listMap.keys.toSet();

      final originalOrderLength = order.length;
      final uniqueOrderedKeys = LinkedHashSet<String>.from(order).toList();
      order = uniqueOrderedKeys;

      final originalUniqueOrderLength = order.length;
      order.removeWhere((key) => !boxKeys.contains(key));

      final Set<String> orderKeys = order.toSet();
      final List<String> newKeys =
          boxKeys.where((key) => !orderKeys.contains(key)).toList();

      if (newKeys.isNotEmpty) {
        order.insertAll(0, newKeys);
      }

      if (order.length != originalUniqueOrderLength ||
          newKeys.isNotEmpty ||
          originalOrderLength != uniqueOrderedKeys.length) {
        saveStudyListOrder(order);
      }

      return order.map((key) => listMap[key]!).whereType<StudyList>().toList();
    }

    yield getSortedLists();

    yield* _box.watch().map((event) {
      return getSortedLists();
    });
  }

  Future<StudyList?> getStudyListByName(String name) async {
    return _box.get(name);
  }

  Future<StudyList?> getStudyListById(String nameKey) async {
    return _box.get(nameKey);
  }

  Future<bool> deleteStudyList(String nameKey) async {
    if (_box.containsKey(nameKey)) {
      await _box.delete(nameKey);
      final order = getStudyListOrder();
      order.remove(nameKey);
      await saveStudyListOrder(order);
      return true;
    }
    return false;
  }

  Future<void> deleteAllStudyLists() async {
    await _studyListBox.clear();
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

  Box<StudyList> get _box => _studyListBox;
}
