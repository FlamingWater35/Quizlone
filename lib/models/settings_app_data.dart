import 'package:json_annotation/json_annotation.dart';

import 'match_record.dart';
import 'study_list.dart';

part 'settings_app_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AppData {
  AppData({required this.studyLists, required this.matchRecords});

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      studyLists:
          (json['studyLists'] as List<dynamic>)
              .map((e) => StudyList.fromJson(e as Map<String, dynamic>))
              .toList(),
      matchRecords:
          (json['matchRecords'] as List<dynamic>)
              .map((e) => MatchRecord.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  final List<MatchRecord> matchRecords;
  final List<StudyList> studyLists;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'studyLists': studyLists.map((e) => e.toJson()).toList(),
    'matchRecords': matchRecords.map((e) => e.toJson()).toList(),
  };
}
