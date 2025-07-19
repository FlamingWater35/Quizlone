import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/study_list.dart';
import '../models/term.dart';

class DatabaseService {
  static const String _studyListBoxName = 'studyListsBox';
  static late Box<StudyList> _studyListBox;

  DatabaseService();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TermAdapter());
    Hive.registerAdapter(StudyListAdapter());

    _studyListBox = await Hive.openBox<StudyList>(_studyListBoxName);
  }

  Box<StudyList> get _box => _studyListBox;

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
}
