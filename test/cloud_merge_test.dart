import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/models/settings_app_data.dart';
import 'package:quizlone/models/study_group.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:quizlone/providers/core/auth_provider.dart';

AppData _appData({
  List<StudyList> lists = const [],
  List<MatchRecord> matches = const [],
  List<StudyGroup> groups = const [],
  List<TestRecord> tests = const [],
}) {
  return AppData(
    studyLists: lists,
    matchRecords: matches,
    studyGroups: groups,
    testRecords: tests,
  );
}

StudyList _list(
  String id,
  String name, {
  DateTime? lastUsedAt,
  DateTime? createdAt,
}) {
  return StudyList(id: id, name: name, createdAt: createdAt ?? DateTime(2024))
    ..lastUsedAt = lastUsedAt ?? DateTime(2024, 1, 1);
}

void main() {
  group('runMergeInIsolate', () {
    test('identical local and remote data yields no local update', () {
      final list = _list('l1', 'A', lastUsedAt: DateTime(2024, 1, 2));
      final local = _appData(lists: [list]);
      final remote = _appData(lists: [_list('l1', 'A', lastUsedAt: DateTime(2024, 1, 2))]);

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024)),
      );
      expect(result.wasLocalUpdated, isFalse);
      expect(result.mergedData.studyLists, hasLength(1));
      expect(result.mergedData.studyLists.first.name, 'A');
    });

    test('remote list is newer -> local updated and remote wins', () {
      final local = _appData(
        lists: [_list('l1', 'Old', lastUsedAt: DateTime(2024, 1, 1))],
      );
      final remote = _appData(
        lists: [_list('l1', 'New', lastUsedAt: DateTime(2024, 1, 3))],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024, 1, 2)),
      );
      expect(result.wasLocalUpdated, isTrue);
      expect(result.mergedData.studyLists.single.name, 'New');
    });

    test('local list is newer -> local wins and no local update flag', () {
      final local = _appData(
        lists: [_list('l1', 'Local', lastUsedAt: DateTime(2024, 1, 5))],
      );
      final remote = _appData(
        lists: [_list('l1', 'Remote', lastUsedAt: DateTime(2024, 1, 3))],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024, 1, 2)),
      );
      expect(result.wasLocalUpdated, isFalse);
      expect(result.mergedData.studyLists.single.name, 'Local');
    });

    test('ties keep the remote copy', () {
      final when = DateTime(2024, 1, 2);
      final local = _appData(lists: [_list('l1', 'L', lastUsedAt: when)]);
      final remote = _appData(lists: [_list('l1', 'R', lastUsedAt: when)]);

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024)),
      );
      expect(result.mergedData.studyLists.single.name, 'R');
    });

    test('local-only list created after last sync is kept', () {
      final local = _appData(
        lists: [
          _list('l1', 'NewLocal', createdAt: DateTime(2024, 2, 1), lastUsedAt: DateTime(2024, 2, 1)),
        ],
      );
      final remote = _appData(lists: []);

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024, 1, 1)),
      );
      expect(result.wasLocalUpdated, isFalse);
      expect(result.mergedData.studyLists.single.name, 'NewLocal');
    });

    test('local-only list created before last sync is treated as remotely deleted', () {
      final local = _appData(
        lists: [
          _list('l1', 'OldLocal', createdAt: DateTime(2023, 12, 1), lastUsedAt: DateTime(2024, 1, 1)),
        ],
      );
      final remote = _appData(lists: []);

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: DateTime(2024, 1, 1)),
      );
      expect(result.wasLocalUpdated, isTrue);
      expect(result.mergedData.studyLists, isEmpty);
    });

    test('lists that exist only remotely are added and flagged', () {
      final local = _appData(lists: []);
      final remote = _appData(lists: [_list('r1', 'RemoteOnly', lastUsedAt: DateTime(2024, 1, 2))]);

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: null),
      );
      expect(result.wasLocalUpdated, isTrue);
      expect(result.mergedData.studyLists.single.id, 'r1');
    });

    test('match records are unioned with no duplicates', () {
      final sharedCreatedAt = DateTime(2024, 1, 1, 10);
      final local = _appData(
        matches: [
          MatchRecord(studyListId: 'l1', timeInTenths: 10, createdAt: sharedCreatedAt),
          MatchRecord(studyListId: 'l1', timeInTenths: 20, createdAt: DateTime(2024, 1, 2)),
        ],
      );
      final remote = _appData(
        matches: [
          MatchRecord(studyListId: 'l1', timeInTenths: 10, createdAt: sharedCreatedAt),
          MatchRecord(studyListId: 'l1', timeInTenths: 30, createdAt: DateTime(2024, 1, 3)),
        ],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: null),
      );
      expect(result.mergedData.matchRecords, hasLength(3));
      final times = result.mergedData.matchRecords.map((r) => r.timeInTenths).toSet();
      expect(times, {10, 20, 30});
    });

    test('remote match records missing locally flag a local update', () {
      final local = _appData(
        matches: [MatchRecord(studyListId: 'l1', timeInTenths: 10, createdAt: DateTime(2024, 1, 1))],
      );
      final remote = _appData(
        matches: [MatchRecord(studyListId: 'l1', timeInTenths: 99, createdAt: DateTime(2024, 1, 3))],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: null),
      );
      expect(result.wasLocalUpdated, isTrue);
    });

    test('test records and groups are unioned by id', () {
      final local = _appData(
        groups: [StudyGroup(name: 'LocalGroup', id: 'g1')],
        tests: [
          TestRecord(id: 't1', studyListId: 'l1', score: 1, totalQuestions: 1, answers: []),
        ],
      );
      final remote = _appData(
        groups: [
          StudyGroup(name: 'RemoteGroup', id: 'g2'),
          StudyGroup(name: 'LocalGroupRenamed', id: 'g1'),
        ],
        tests: [
          TestRecord(id: 't2', studyListId: 'l1', score: 2, totalQuestions: 2, answers: []),
        ],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: null),
      );
      expect(result.mergedData.studyGroups, hasLength(2));
      final groupNames = result.mergedData.studyGroups.map((g) => g.name).toSet();
      expect(groupNames, {'RemoteGroup', 'LocalGroupRenamed'});
      expect(result.mergedData.testRecords.map((t) => t.id).toSet(), {'t1', 't2'});
      expect(result.wasLocalUpdated, isTrue);
    });

    test('disjoint local and remote data merge into a superset', () {
      final local = _appData(
        lists: [_list('l1', 'LocalList', lastUsedAt: DateTime(2024, 1, 1))],
        matches: [MatchRecord(studyListId: 'l1', timeInTenths: 5)],
      );
      final remote = _appData(
        lists: [_list('r1', 'RemoteList', lastUsedAt: DateTime(2024, 1, 2))],
        matches: [MatchRecord(studyListId: 'r1', timeInTenths: 7)],
      );

      final result = runMergeInIsolate(
        MergeInput(local: local, remote: remote, localTimestamp: null),
      );
      expect(result.mergedData.studyLists.map((l) => l.id).toSet(), {'l1', 'r1'});
      expect(result.mergedData.matchRecords, hasLength(2));
      expect(result.wasLocalUpdated, isTrue);
    });
  });
}
