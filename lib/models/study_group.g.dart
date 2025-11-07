// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudyGroupAdapter extends TypeAdapter<StudyGroup> {
  @override
  final typeId = 3;

  @override
  StudyGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudyGroup(
      name: fields[1] as String,
      id: fields[0] as String?,
      createdAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, StudyGroup obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudyGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyGroup _$StudyGroupFromJson(Map<String, dynamic> json) => StudyGroup(
  name: json['name'] as String,
  id: json['id'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$StudyGroupToJson(StudyGroup instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
    };
