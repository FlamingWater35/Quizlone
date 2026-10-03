import 'enums/enums.dart';

/// Global study-behavior defaults applied to newly created lists (and to
/// existing lists only via the explicit "Apply to all lists" action).
///
/// Stored as a JSON string in the settings box — no Hive adapter needed.
/// [fromJson] is tolerant: unknown/missing/corrupt fields fall back to the
/// same defaults the [StudyList] model itself uses, so a bad blob can never
/// crash the app.
class StudyDefaults {
  const StudyDefaults({
    this.flashcardStartSide = FlashcardStartSide.term,
    this.askWith = StudyQuestionType.definition,
    this.testFormat = TestFormat.written,
    this.studyLength,
    this.ignoreBrackets = true,
    this.allowAnswerSubstring = false,
  });

  final FlashcardStartSide flashcardStartSide;
  final StudyQuestionType askWith;
  final TestFormat testFormat;
  final int? studyLength;
  final bool ignoreBrackets;
  final bool allowAnswerSubstring;

  StudyDefaults copyWith({
    FlashcardStartSide? flashcardStartSide,
    StudyQuestionType? askWith,
    TestFormat? testFormat,
    int? studyLength,
    bool clearStudyLength = false,
    bool? ignoreBrackets,
    bool? allowAnswerSubstring,
  }) {
    return StudyDefaults(
      flashcardStartSide: flashcardStartSide ?? this.flashcardStartSide,
      askWith: askWith ?? this.askWith,
      testFormat: testFormat ?? this.testFormat,
      studyLength: clearStudyLength
          ? null
          : (studyLength ?? this.studyLength),
      ignoreBrackets: ignoreBrackets ?? this.ignoreBrackets,
      allowAnswerSubstring: allowAnswerSubstring ?? this.allowAnswerSubstring,
    );
  }

  Map<String, dynamic> toJson() => {
        'flashcardStartSide': flashcardStartSide.name,
        'askWith': askWith.name,
        'testFormat': testFormat.name,
        'studyLength': studyLength,
        'ignoreBrackets': ignoreBrackets,
        'allowAnswerSubstring': allowAnswerSubstring,
      };

  factory StudyDefaults.fromJson(Map<String, dynamic> json) {
    FlashcardStartSide start = FlashcardStartSide.values.firstWhere(
      (e) => e.name == json['flashcardStartSide'],
      orElse: () => FlashcardStartSide.term,
    );
    StudyQuestionType ask = StudyQuestionType.values.firstWhere(
      (e) => e.name == json['askWith'],
      orElse: () => StudyQuestionType.definition,
    );
    TestFormat format = TestFormat.values.firstWhere(
      (e) => e.name == json['testFormat'],
      orElse: () => TestFormat.written,
    );
    final rawLength = json['studyLength'];
    return StudyDefaults(
      flashcardStartSide: start,
      askWith: ask,
      testFormat: format,
      studyLength: rawLength is int ? rawLength : null,
      ignoreBrackets: json['ignoreBrackets'] is bool
          ? json['ignoreBrackets'] as bool
          : true,
      allowAnswerSubstring: json['allowAnswerSubstring'] is bool
          ? json['allowAnswerSubstring'] as bool
          : false,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is StudyDefaults &&
      other.flashcardStartSide == flashcardStartSide &&
      other.askWith == askWith &&
      other.testFormat == testFormat &&
      other.studyLength == studyLength &&
      other.ignoreBrackets == ignoreBrackets &&
      other.allowAnswerSubstring == allowAnswerSubstring;

  @override
  int get hashCode => Object.hash(
        flashcardStartSide,
        askWith,
        testFormat,
        studyLength,
        ignoreBrackets,
        allowAnswerSubstring,
      );
}
