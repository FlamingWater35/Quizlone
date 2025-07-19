import 'package:hive_ce/hive.dart';

part 'term.g.dart';

@HiveType(typeId: 1)
class Term {
  @HiveField(0)
  late String definitionText;

  @HiveField(1)
  late String termText;

  Term();
}
