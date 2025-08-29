import 'package:json_annotation/json_annotation.dart';

import 'match_record.dart';
import 'study_list.dart';

part 'settings_app_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AppData {
  final List<StudyList> studyLists;
  final List<MatchRecord> matchRecords;
  final List<String> studyListOrder;

  AppData({
    required this.studyLists,
    required this.matchRecords,
    required this.studyListOrder,
  });

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
