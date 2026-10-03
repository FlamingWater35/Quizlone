/// Centralized answer-grading logic shared by Learn mode and Test mode.
///
/// Preserves the pre-existing semantics exactly (trim + lowercase + optional
/// bracket stripping + optional comma-separated substring acceptance). The two
/// new global flags — [ignorePunctuation] and [ignoreAccents] — add a
/// *lenient* comparison pass that only runs when at least one flag is on, so
/// behavior is byte-identical when both are off.
library;

/// Latin-1 Supplement accent-fold table (covers all 11 app languages).
/// Map-based on purpose — no new dependency.
const Map<int, String> _accentFold = {
  0x00C0: 'A', 0x00C1: 'A', 0x00C2: 'A', 0x00C3: 'A', 0x00C4: 'A',
  0x00C5: 'A', 0x00C7: 'C', 0x00C8: 'E', 0x00C9: 'E', 0x00CA: 'E',
  0x00CB: 'E', 0x00CC: 'I', 0x00CD: 'I', 0x00CE: 'I', 0x00CF: 'I',
  0x00D1: 'N', 0x00D2: 'O', 0x00D3: 'O', 0x00D4: 'O', 0x00D5: 'O',
  0x00D6: 'O', 0x00D8: 'O', 0x00D9: 'U', 0x00DA: 'U', 0x00DB: 'U',
  0x00DC: 'U', 0x00DD: 'Y', 0x00DF: 'ss',
  0x00E0: 'a', 0x00E1: 'a', 0x00E2: 'a', 0x00E3: 'a', 0x00E4: 'a',
  0x00E5: 'a', 0x00E7: 'c', 0x00E8: 'e', 0x00E9: 'e', 0x00EA: 'e',
  0x00EB: 'e', 0x00EC: 'i', 0x00ED: 'i', 0x00EE: 'i', 0x00EF: 'i',
  0x00F1: 'n', 0x00F2: 'o', 0x00F3: 'o', 0x00F4: 'o', 0x00F5: 'o',
  0x00F6: 'o', 0x00F8: 'o', 0x00F9: 'u', 0x00FA: 'u', 0x00FB: 'u',
  0x00FC: 'u', 0x00FD: 'y', 0x00FF: 'y',
};

String _foldAccents(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    buffer.write(_accentFold[rune] ?? String.fromCharCode(rune));
  }
  return buffer.toString();
}

final RegExp _punctuationRegExp = RegExp(r'[\p{P}\p{S}]', unicode: true);
final RegExp _whitespaceRegExp = RegExp(r'\s+');
final RegExp _bracketRegExp = RegExp(r'\[[\s\S]*?\]');

/// Returns true when [userAnswer] is accepted for [correctAnswer].
bool isAnswerCorrect({
  required String userAnswer,
  required String correctAnswer,
  required bool allowSubstring,
  required bool ignoreBrackets,
  required bool ignorePunctuation,
  required bool ignoreAccents,
}) {
  String base(String raw) {
    var s = raw.trim().toLowerCase();
    if (ignoreBrackets) {
      s = s.replaceAll(_bracketRegExp, '').trim();
    }
    return s;
  }

  final user = base(userAnswer);
  final correct = base(correctAnswer);

  // Candidate set: the full answer, plus each comma-separated part when
  // substring acceptance is enabled (mirrors prior behavior).
  List<String> candidates;
  if (allowSubstring && correct.contains(',')) {
    candidates = [
      correct,
      ...correct.split(',').map((p) => p.trim()).where((p) => p.isNotEmpty),
    ];
  } else {
    candidates = [correct];
  }

  // Strict pass — identical to pre-existing behavior.
  if (candidates.contains(user)) return true;

  // Lenient pass only runs when a strictness flag is explicitly on, so
  // default behavior is unchanged.
  if (!ignorePunctuation && !ignoreAccents) return false;

  String lenient(String s) {
    var x = s;
    if (ignoreAccents) x = _foldAccents(x);
    if (ignorePunctuation) x = x.replaceAll(_punctuationRegExp, '');
    x = x.replaceAll(_whitespaceRegExp, ' ').trim();
    return x;
  }

  final lenientUser = lenient(user);
  return candidates.any((c) => lenient(c) == lenientUser);
}
