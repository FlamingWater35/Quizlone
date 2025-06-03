import 'package:isar/isar.dart';

import './term.dart';

part 'study_list.g.dart';

@collection
class StudyList {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? name;

  List<Term> terms = [];

  DateTime createdAt = DateTime.now();
  DateTime lastUsedAt = DateTime.now();

  bool flashcardShowTermFirst = true;
  bool studyShowDefinitionAskTerm = true;
  String testFormat = 'written';
  int? testStudyLength;

  void updateLastUsed() {
    lastUsedAt = DateTime.now();
  }
}
