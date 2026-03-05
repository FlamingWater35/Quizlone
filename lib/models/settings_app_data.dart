import 'package:json_annotation/json_annotation.dart';

import 'match_record.dart';
import 'study_group.dart';
import 'study_list.dart';
import 'test_record.dart';

part 'settings_app_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AppData {
  AppData({
    required this.studyLists,
    required this.matchRecords,
    this.studyGroups = const [],
    this.testRecords = const [],
    this.lastUpdatedBy,
  });

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  final String? lastUpdatedBy;
  final List<MatchRecord> matchRecords;
  final List<StudyGroup> studyGroups;
  final List<TestRecord> testRecords;
  final List<StudyList> studyLists;

  Map<String, dynamic> toJson() => _$AppDataToJson(this);

  AppData copyWith({
    List<StudyList>? studyLists,
    List<MatchRecord>? matchRecords,
    List<StudyGroup>? studyGroups,
    List<TestRecord>? testRecords,
    String? lastUpdatedBy,
  }) {
    return AppData(
      studyLists: studyLists ?? this.studyLists,
      matchRecords: matchRecords ?? this.matchRecords,
      studyGroups: studyGroups ?? this.studyGroups,
      testRecords: testRecords ?? this.testRecords,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
    );
  }
}
