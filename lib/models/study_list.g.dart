// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudyListAdapter extends TypeAdapter<StudyList> {
  @override
  final typeId = 0;

  @override
  StudyList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyList()
      ..name = fields[0] as String
      ..terms = (fields[1] as List).cast<Term>()
      ..createdAt = fields[2] as DateTime
      ..lastUsedAt = fields[3] as DateTime
      ..flashcardShowTermFirst = fields[4] as bool
      ..studyShowDefinitionAskTerm = fields[5] as bool
      ..testStudyLength = (fields[6] as num?)?.toInt()
      .._testFormatString = fields[7] as String
      ..lastOpenedAt = fields[8] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, StudyList obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.terms)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.lastUsedAt)
      ..writeByte(4)
      ..write(obj.flashcardShowTermFirst)
      ..writeByte(5)
      ..write(obj.studyShowDefinitionAskTerm)
      ..writeByte(6)
      ..write(obj.testStudyLength)
      ..writeByte(7)
      ..write(obj._testFormatString)
      ..writeByte(8)
      ..write(obj.lastOpenedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyList _$StudyListFromJson(Map<String, dynamic> json) =>
    StudyList()
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..flashcardShowTermFirst = json['flashcardShowTermFirst'] as bool
      ..lastUsedAt = DateTime.parse(json['lastUsedAt'] as String)
      ..lastOpenedAt =
          json['lastOpenedAt'] == null
              ? null
              : DateTime.parse(json['lastOpenedAt'] as String)
      ..name = json['name'] as String
      ..studyShowDefinitionAskTerm = json['studyShowDefinitionAskTerm'] as bool
      ..terms =
          (json['terms'] as List<dynamic>)
              .map((e) => Term.fromJson(e as Map<String, dynamic>))
              .toList()
      ..testStudyLength = (json['testStudyLength'] as num?)?.toInt();

Map<String, dynamic> _$StudyListToJson(StudyList instance) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'flashcardShowTermFirst': instance.flashcardShowTermFirst,
  'lastUsedAt': instance.lastUsedAt.toIso8601String(),
  'lastOpenedAt': instance.lastOpenedAt?.toIso8601String(),
  'name': instance.name,
  'studyShowDefinitionAskTerm': instance.studyShowDefinitionAskTerm,
  'terms': instance.terms.map((e) => e.toJson()).toList(),
  'testStudyLength': instance.testStudyLength,
};
