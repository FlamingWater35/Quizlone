import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'term.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Term {
  Term();

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  @HiveField(0)
  late String definitionText;

  @HiveField(1)
  late String termText;

  Map<String, dynamic> toJson() => _$TermToJson(this);
}
