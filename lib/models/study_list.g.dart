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
      .._testFormatString = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, StudyList obj) {
    writer
      ..writeByte(8)
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
      ..write(obj._testFormatString);
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
