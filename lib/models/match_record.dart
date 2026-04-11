import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_record.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class MatchRecord {
  MatchRecord({
    required this.studyListId,
    required this.timeInTenths,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory MatchRecord.fromJson(Map<String, dynamic> json) {
    if (json['studyListId'] == null && json['studyListName'] != null) {
      json['studyListId'] = json['studyListName'];
    }
    return _$MatchRecordFromJson(json);
  }

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(0)
  final String studyListId;

  @HiveField(1)
  final int timeInTenths;

  Map<String, dynamic> toJson() => _$MatchRecordToJson(this);
}
