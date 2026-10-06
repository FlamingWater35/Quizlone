import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';

import 'helpers/test_data.dart';

StudyList _list(String name, {DateTime? openedAt}) {
  return listWithTerms(name, [term('t', 'd')])..lastOpenedAt = openedAt;
}

void main() {
  group('recentStudyLists', () {
    test('returns empty for no lists', () {
      expect(recentStudyLists(const []), isEmpty);
    });

    test('excludes lists that were never opened', () {
      final lists = [
        _list('opened', openedAt: DateTime(2026, 1, 1)),
        _list('never opened'),
      ];
      final recent = recentStudyLists(lists);
      expect(recent.map((l) => l.name), ['opened']);
    });

    test('sorts newest first', () {
      final lists = [
        _list('old', openedAt: DateTime(2026, 1, 1)),
        _list('new', openedAt: DateTime(2026, 6, 1)),
        _list('middle', openedAt: DateTime(2026, 3, 1)),
      ];
      final recent = recentStudyLists(lists);
      expect(recent.map((l) => l.name), ['new', 'middle', 'old']);
    });

    test('caps at three entries by default', () {
      final lists = List.generate(
        8,
        (i) => _list('list-$i', openedAt: DateTime(2026, 1, 1 + i)),
      );
      final recent = recentStudyLists(lists);
      expect(recent.length, 3);
      expect(recent.first.name, 'list-7');
      expect(recent.last.name, 'list-5');
    });

    test('respects a custom limit', () {
      final lists = List.generate(
        4,
        (i) => _list('list-$i', openedAt: DateTime(2026, 1, 1 + i)),
      );
      expect(recentStudyLists(lists, limit: 2).length, 2);
    });

    test('does not mutate the input order', () {
      final a = _list('a', openedAt: DateTime(2026, 1, 1));
      final b = _list('b', openedAt: DateTime(2026, 6, 1));
      final lists = [a, b];
      recentStudyLists(lists);
      expect(lists.map((l) => l.name), ['a', 'b']);
    });
  });
}
