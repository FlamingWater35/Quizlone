import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/study_list.dart';
import '../models/term.dart';

class DatabaseService {
  DatabaseService();

  static late Box _settingsBox;
  static const String _settingsBoxName = 'settingsBox';
  static late Box<StudyList> _studyListBox;
  static const String _studyListBoxName = 'studyListsBox';

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

  // Methods for settings
  Future<void> saveTheme(String themeName) async {
    await _settingsBox.put('theme', themeName);
  }

  String getTheme() {
    return _settingsBox.get('theme', defaultValue: 'system');
  }

  Box<StudyList> get _box => _studyListBox;
}
