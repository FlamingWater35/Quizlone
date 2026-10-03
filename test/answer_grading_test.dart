import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/services/answer_grading.dart';

void main() {
  bool check(
    String user,
    String correct, {
    bool allowSubstring = false,
    bool ignoreBrackets = false,
    bool ignorePunctuation = false,
    bool ignoreAccents = false,
  }) =>
      isAnswerCorrect(
        userAnswer: user,
        correctAnswer: correct,
        allowSubstring: allowSubstring,
        ignoreBrackets: ignoreBrackets,
        ignorePunctuation: ignorePunctuation,
        ignoreAccents: ignoreAccents,
      );

  group('isAnswerCorrect', () {
    test('exact match (case-insensitive, trimmed)', () {
      expect(check('  Apple ', 'apple'), isTrue);
      expect(check('APPLE', 'apple'), isTrue);
    });

    test('mismatch rejected by default', () {
      expect(check('apple!', 'apple'), isFalse);
      expect(check('cafe', 'café'), isFalse);
    });

    test('brackets stripped when ignoreBrackets', () {
      expect(
        check('hello', 'hello [pronounced hel-oh]', ignoreBrackets: true),
        isTrue,
      );
      expect(check('hello [x]', 'hello', ignoreBrackets: false), isFalse);
    });

    test('comma-separated candidates when allowSubstring', () {
      expect(check('a', 'a, b', allowSubstring: true), isTrue);
      expect(check('a, b', 'a, b', allowSubstring: true), isTrue);
      expect(check('c', 'a, b', allowSubstring: true), isFalse);
    });

    test('punctuation ignored when flag on', () {
      expect(check('apple!', 'Apple', ignorePunctuation: true), isTrue);
      expect(check("it's", 'its', ignorePunctuation: true), isTrue);
    });

    test('accents folded when flag on', () {
      expect(check('cafe', 'café', ignoreAccents: true), isTrue);
      expect(check('CAFE', 'café', ignoreAccents: true), isTrue);
      expect(check('naïve', 'naive', ignoreAccents: true), isTrue);
    });

    test('combined substring + punctuation', () {
      expect(
        check(
          'new york!',
          'New York, NYC',
          allowSubstring: true,
          ignorePunctuation: true,
        ),
        isTrue,
      );
    });

    test('CJK stays exact (no accidental folding)', () {
      expect(check('太陽', '太阳'), isFalse);
      expect(check('太陽', '太陽'), isTrue);
    });

    test('whitespace collapsed only in lenient pass', () {
      expect(check('a  b', 'a b', ignorePunctuation: true), isTrue);
      expect(check('a  b', 'a b'), isFalse);
    });

    test('lenient pass never fires when both flags are off', () {
      expect(check('apple!', 'apple'), isFalse);
      expect(check('cafe', 'café'), isFalse);
      expect(check('a  b', 'a b'), isFalse);
    });
  });
}
