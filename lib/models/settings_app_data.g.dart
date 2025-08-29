// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
  studyLists:
      (json['studyLists'] as List<dynamic>)
          .map((e) => StudyList.fromJson(e as Map<String, dynamic>))
          .toList(),
  matchRecords:
      (json['matchRecords'] as List<dynamic>)
          .map((e) => MatchRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
  'matchRecords': instance.matchRecords.map((e) => e.toJson()).toList(),
  'studyLists': instance.studyLists.map((e) => e.toJson()).toList(),
};
