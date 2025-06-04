import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/study_list.dart';

class IsarService {
  IsarService() {
    db = openDB();
  }

  late Future<Isar> db;

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [StudyListSchema],
        name: "quizlone",
        directory: dir.path,
        inspector: false,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<Id> saveStudyList(StudyList list) async {
    final isar = await db;
    Id newId = 0;
    await isar.writeTxn(() async {
      newId = await isar.studyLists.put(list);
    });
    return newId;
  }

  Future<List<StudyList>> getAllStudyLists() async {
    final isar = await db;
    return await isar.studyLists.where().sortByCreatedAtDesc().findAll();
  }

  Stream<List<StudyList>> listenToStudyLists() async* {
    final isar = await db;
    yield* isar.studyLists.where().sortByCreatedAtDesc().watch(
      fireImmediately: true,
    );
  }

  Future<StudyList?> getStudyListByName(String name) async {
    final isar = await db;
    return await isar.studyLists.filter().nameEqualTo(name).findFirst();
  }

  Future<StudyList?> getStudyListById(Id id) async {
    final isar = await db;
    return await isar.studyLists.get(id);
  }

  Future<bool> deleteStudyList(Id id) async {
    final isar = await db;
    bool success = false;
    await isar.writeTxn(() async {
      success = await isar.studyLists.delete(id);
    });
    return success;
  }
}
