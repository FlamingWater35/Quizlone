// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchRecordAdapter extends TypeAdapter<MatchRecord> {
  @override
  final typeId = 2;

  @override
  MatchRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchRecord(
      studyListName: fields[0] as String,
      timeInTenths: (fields[1] as num).toInt(),
      createdAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MatchRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.studyListName)
      ..writeByte(1)
      ..write(obj.timeInTenths)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRecord _$MatchRecordFromJson(Map<String, dynamic> json) => MatchRecord(
  studyListName: json['studyListName'] as String,
  timeInTenths: (json['timeInTenths'] as num).toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MatchRecordToJson(MatchRecord instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'studyListName': instance.studyListName,
      'timeInTenths': instance.timeInTenths,
    };
