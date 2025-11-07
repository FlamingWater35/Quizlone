import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'study_group.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class StudyGroup {
  StudyGroup({required this.name, String? id, DateTime? createdAt})
    : id = id ?? const Uuid().v4(),
      createdAt = createdAt ?? DateTime.now();

  factory StudyGroup.fromJson(Map<String, dynamic> json) =>
      _$StudyGroupFromJson(json);

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  Map<String, dynamic> toJson() => _$StudyGroupToJson(this);
}
