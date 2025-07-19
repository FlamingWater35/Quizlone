import 'package:hive_ce/hive.dart';

import './term.dart';
import 'enums/enums.dart';

part 'study_list.g.dart';

@HiveType(typeId: 0)
class StudyList {
  @HiveField(0)
  late String name;

  @HiveField(1)
  List<Term> terms = [];

  @HiveField(2)
  DateTime createdAt = DateTime.now();

  @HiveField(3)
  DateTime lastUsedAt = DateTime.now();

  @HiveField(4)
  bool flashcardShowTermFirst = true;

  @HiveField(5)
  bool studyShowDefinitionAskTerm = true;

  @HiveField(6)
  int? testStudyLength;

  @HiveField(7)
  String _testFormatString = TestFormat.written.name;

  TestFormat get testFormat => TestFormat.values.firstWhere(
    (e) => e.name == _testFormatString,
    orElse: () => TestFormat.written,
  );
  set testFormat(TestFormat value) => _testFormatString = value.name;

  StudyList();

  void updateLastUsed() {
    lastUsedAt = DateTime.now();
  }
}
