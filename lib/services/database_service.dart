import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/study_list.dart';
import '../models/term.dart';

class DatabaseService {
  DatabaseService();

  static late Box _settingsBox;
  static const String _settingsBoxName = 'settingsBox';
  static late Box<StudyList> _studyListBox;
  static const String _studyListBoxName = 'studyListsBox';
  static const String _activeListIdKey = 'activeListId';

  static Future<void> init() async {
    await Hive.initFlutter('Quizlone');

    Hive.registerAdapter(TermAdapter());
    Hive.registerAdapter(StudyListAdapter());

    _studyListBox = await Hive.openBox<StudyList>(_studyListBoxName);
    _settingsBox = await Hive.openBox(_settingsBoxName);
  }

  Future<String> saveStudyList(StudyList list) async {
    await _box.put(list.name, list);
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
          ..flashcardShowTermFirst = listToRename.flashcardShowTermFirst
          ..studyShowDefinitionAskTerm = listToRename.studyShowDefinitionAskTerm
          ..testStudyLength = listToRename.testStudyLength
          ..testFormat = listToRename.testFormat;

    await _box.put(newName, updatedList);
    await _box.delete(oldNameKey);

    return true;
  }

  Future<List<StudyList>> getAllStudyLists() async {
    final lists = _box.values.toList();
    lists.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return lists;
  }

  Stream<List<StudyList>> listenToStudyLists() async* {
    List<StudyList> getSortedLists() {
      final lists = _box.values.toList();
      lists.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return lists;
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
