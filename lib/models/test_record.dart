import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'test_record.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class TestAnswerRecord {
  TestAnswerRecord({
    required this.questionText,
    required this.correctAnswer,
    required this.userAnswer,
    required this.isCorrect,
  });

  factory TestAnswerRecord.fromJson(Map<String, dynamic> json) =>
      _$TestAnswerRecordFromJson(json);

  @HiveField(0)
  final String correctAnswer;

  @HiveField(1)
  final bool isCorrect;

  @HiveField(2)
  final String questionText;

  @HiveField(3)
  final String? userAnswer;

  Map<String, dynamic> toJson() => _$TestAnswerRecordToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable(explicitToJson: true)
class TestRecord {
  TestRecord({
    required this.studyListId,
    required this.score,
    required this.totalQuestions,
    required this.answers,
    String? id,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();

  factory TestRecord.fromJson(Map<String, dynamic> json) =>
      _$TestRecordFromJson(json);

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String studyListId;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final int score;

  @HiveField(4)
  final int totalQuestions;

  @HiveField(5)
  final List<TestAnswerRecord> answers;

  Map<String, dynamic> toJson() => _$TestRecordToJson(this);
}
