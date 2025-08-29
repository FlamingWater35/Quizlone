import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './term.dart';
import 'enums/enums.dart';

part 'study_list.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class StudyList {
  StudyList();

  factory StudyList.fromJson(Map<String, dynamic> json) =>
      _$StudyListFromJson(json);

  @HiveField(2)
  DateTime createdAt = DateTime.now();

  @HiveField(4)
  bool flashcardShowTermFirst = true;

  @HiveField(9)
  late String id;

  @HiveField(8)
  DateTime? lastOpenedAt;

  @HiveField(3)
  DateTime lastUsedAt = DateTime.now();

  @HiveField(0)
  late String name;

  @HiveField(5)
  bool studyShowDefinitionAskTerm = true;

  @HiveField(1)
  List<Term> terms = [];

  @HiveField(6)
  int? testStudyLength;

  @HiveField(7)
  String _testFormatString = TestFormat.written.name;

  @JsonKey(includeFromJson: false, includeToJson: false)
  TestFormat get testFormat => TestFormat.values.firstWhere(
    (e) => e.name == _testFormatString,
    orElse: () => TestFormat.written,
  );

  set testFormat(TestFormat value) => _testFormatString = value.name;

  void updateLastUsed() {
    lastUsedAt = DateTime.now();
  }

  Map<String, dynamic> toJson() => _$StudyListToJson(this);
}
