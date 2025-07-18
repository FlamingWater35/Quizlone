// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TermAdapter extends TypeAdapter<Term> {
  @override
  final typeId = 1;

  @override
  Term read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Term()
      ..definitionText = fields[0] as String
      ..termText = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Term obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.definitionText)
      ..writeByte(1)
      ..write(obj.termText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TermAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
