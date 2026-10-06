import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:quizlone/providers/study/study_stats_providers.dart';

import 'helpers/fake_database_service.dart';

void main() {
  late FakeDatabaseService fakeDb;

  setUp(() {
    fakeDb = FakeDatabaseService();
  });

  test('latestTestRecordProvider returns the newest record for the list',
      () async {
    final record = TestRecord(
      studyListId: 'list-a',
      score: 5,
      totalQuestions: 6,
      answers: [],
    );
    await fakeDb.saveTestRecord(record);

    final container = ProviderContainer(
      overrides: [FakeDatabaseService.asOverride(fakeDb)],
    );
    addTearDown(container.dispose);

    final fetched = await container.read(
      latestTestRecordProvider('list-a').future,
    );
    expect(fetched, isNotNull);
    expect(fetched!.score, 5);

    final missing = await container.read(
      latestTestRecordProvider('other').future,
    );
    expect(missing, isNull);
  });
}
