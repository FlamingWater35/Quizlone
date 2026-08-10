import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/models/term.dart';

/// Small helpers for building test data quickly.
Term term(String t, String d) => Term()
  ..termText = t
  ..definitionText = d;

StudyList listWithTerms(String name, List<Term> terms, {String? id}) {
  return StudyList(id: id, name: name, terms: terms);
}

List<Term> sampleTerms(int count) {
  return List.generate(count, (i) => term('Term $i', 'Definition $i'));
}
