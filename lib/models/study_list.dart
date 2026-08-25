import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import './term.dart';
import 'enums/enums.dart';

part 'study_list.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class StudyList {
  StudyList({
    String? id,
    this.name = "",
    List<Term>? terms,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       terms = terms ?? [],
       createdAt = createdAt ?? DateTime.now();

  factory StudyList.fromJson(Map<String, dynamic> json) =>
      _$StudyListFromJson(json);

  @HiveField(10, defaultValue: false)
  bool allowAnswerSubstring = false;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(4)
  bool flashcardShowTermFirst = true;

  @HiveField(11)
  String? groupId;

  @HiveField(12, defaultValue: true)
  bool ignoreBrackets = true;

  @HiveField(9)
  String id;

  @HiveField(8)
  DateTime? lastOpenedAt;

  @HiveField(3)
  DateTime lastUsedAt = DateTime.now();

  @HiveField(0)
  String name;

  @HiveField(5)
  bool studyShowDefinitionAskTerm = true;

  @HiveField(1)
  List<Term> terms;

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

  StudyList copyWith({
    String? id,
    String? name,
    List<Term>? terms,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? lastOpenedAt,
    bool? flashcardShowTermFirst,
    bool? studyShowDefinitionAskTerm,
    int? testStudyLength,
    TestFormat? testFormat,
    bool? allowAnswerSubstring,
    String? groupId,
    bool? ignoreBrackets,
  }) {
    final newList =
        StudyList(
            id: id ?? this.id,
            name: name ?? this.name,
            terms: terms ?? List.from(this.terms),
            createdAt: createdAt ?? this.createdAt,
          )
          ..lastUsedAt = lastUsedAt ?? this.lastUsedAt
          ..lastOpenedAt = lastOpenedAt ?? this.lastOpenedAt
          ..flashcardShowTermFirst =
              flashcardShowTermFirst ?? this.flashcardShowTermFirst
          ..studyShowDefinitionAskTerm =
              studyShowDefinitionAskTerm ?? this.studyShowDefinitionAskTerm
          ..testStudyLength = testStudyLength ?? this.testStudyLength
          ..testFormat = testFormat ?? this.testFormat
          ..allowAnswerSubstring =
              allowAnswerSubstring ?? this.allowAnswerSubstring
          ..groupId = groupId ?? this.groupId
          ..ignoreBrackets = ignoreBrackets ?? this.ignoreBrackets;
    return newList;
  }
}
