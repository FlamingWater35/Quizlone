import 'package:json_annotation/json_annotation.dart';

import 'match_record.dart';
import 'study_group.dart';
import 'study_list.dart';

part 'settings_app_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AppData {
  AppData({
    required this.studyLists,
    required this.matchRecords,
    required this.studyListOrder,
    this.studyGroups = const [],
    this.lastUpdatedBy,
  });

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  final String? lastUpdatedBy;
  final List<MatchRecord> matchRecords;
  final List<StudyGroup> studyGroups;
  final List<String> studyListOrder;
  final List<StudyList> studyLists;

  Map<String, dynamic> toJson() => _$AppDataToJson(this);

  AppData copyWith({
    List<StudyList>? studyLists,
    List<MatchRecord>? matchRecords,
    List<String>? studyListOrder,
    List<StudyGroup>? studyGroups,
    String? lastUpdatedBy,
  }) {
    return AppData(
      studyLists: studyLists ?? this.studyLists,
      matchRecords: matchRecords ?? this.matchRecords,
      studyListOrder: studyListOrder ?? this.studyListOrder,
      studyGroups: studyGroups ?? this.studyGroups,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
    );
  }
}
