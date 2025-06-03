// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashcardStartWithHash() =>
    r'0c463753737b0a084fb00a23bc40549a62b91c35';

/// See also [FlashcardStartWith].
@ProviderFor(FlashcardStartWith)
final flashcardStartWithProvider = AutoDisposeNotifierProvider<
    FlashcardStartWith, FlashcardStartSide>.internal(
  FlashcardStartWith.new,
  name: r'flashcardStartWithProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashcardStartWithHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlashcardStartWith = AutoDisposeNotifier<FlashcardStartSide>;
String _$studyAskWithHash() => r'71a31558146cfe636d6c3a8d3f7b09385b5ec9e5';

/// See also [StudyAskWith].
@ProviderFor(StudyAskWith)
final studyAskWithProvider =
    AutoDisposeNotifierProvider<StudyAskWith, StudyQuestionType>.internal(
  StudyAskWith.new,
  name: r'studyAskWithProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$studyAskWithHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudyAskWith = AutoDisposeNotifier<StudyQuestionType>;
String _$testQuestionFormatHash() =>
    r'9962dbff548845c55ed0779cb0dc198320b25e1f';

/// See also [TestQuestionFormat].
@ProviderFor(TestQuestionFormat)
final testQuestionFormatProvider =
    AutoDisposeNotifierProvider<TestQuestionFormat, TestFormat>.internal(
  TestQuestionFormat.new,
  name: r'testQuestionFormatProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testQuestionFormatHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestQuestionFormat = AutoDisposeNotifier<TestFormat>;
String _$studyLengthHash() => r'3a0c1f824021e975bc2406f2f01bc444315fd839';

/// See also [StudyLength].
@ProviderFor(StudyLength)
final studyLengthProvider =
    AutoDisposeNotifierProvider<StudyLength, int?>.internal(
  StudyLength.new,
  name: r'studyLengthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$studyLengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudyLength = AutoDisposeNotifier<int?>;
String _$flashcardOptionsHash() => r'1dfdf20a1c48a587cb2bc390ab6ee9b4bbffd880';

/// See also [FlashcardOptions].
@ProviderFor(FlashcardOptions)
final flashcardOptionsProvider =
    AutoDisposeNotifierProvider<FlashcardOptions, FlashcardStartSide>.internal(
  FlashcardOptions.new,
  name: r'flashcardOptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashcardOptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlashcardOptions = AutoDisposeNotifier<FlashcardStartSide>;
String _$learnModeControllerHash() =>
    r'75b12522dbb56f2326350eb63367572f3ccb07ef';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LearnModeController
    extends BuildlessAutoDisposeNotifier<LearnModeState> {
  late final List<Term> initialTerms;

  LearnModeState build(
    List<Term> initialTerms,
  );
}

/// See also [LearnModeController].
@ProviderFor(LearnModeController)
const learnModeControllerProvider = LearnModeControllerFamily();

/// See also [LearnModeController].
class LearnModeControllerFamily extends Family<LearnModeState> {
  /// See also [LearnModeController].
  const LearnModeControllerFamily();

  /// See also [LearnModeController].
  LearnModeControllerProvider call(
    List<Term> initialTerms,
  ) {
    return LearnModeControllerProvider(
      initialTerms,
    );
  }

  @override
  LearnModeControllerProvider getProviderOverride(
    covariant LearnModeControllerProvider provider,
  ) {
    return call(
      provider.initialTerms,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'learnModeControllerProvider';
}

/// See also [LearnModeController].
class LearnModeControllerProvider extends AutoDisposeNotifierProviderImpl<
    LearnModeController, LearnModeState> {
  /// See also [LearnModeController].
  LearnModeControllerProvider(
    List<Term> initialTerms,
  ) : this._internal(
          () => LearnModeController()..initialTerms = initialTerms,
          from: learnModeControllerProvider,
          name: r'learnModeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$learnModeControllerHash,
          dependencies: LearnModeControllerFamily._dependencies,
          allTransitiveDependencies:
              LearnModeControllerFamily._allTransitiveDependencies,
          initialTerms: initialTerms,
        );

  LearnModeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initialTerms,
  }) : super.internal();

  final List<Term> initialTerms;

  @override
  LearnModeState runNotifierBuild(
    covariant LearnModeController notifier,
  ) {
    return notifier.build(
      initialTerms,
    );
  }

  @override
  Override overrideWith(LearnModeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: LearnModeControllerProvider._internal(
        () => create()..initialTerms = initialTerms,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initialTerms: initialTerms,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LearnModeController, LearnModeState>
      createElement() {
    return _LearnModeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LearnModeControllerProvider &&
        other.initialTerms == initialTerms;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialTerms.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LearnModeControllerRef on AutoDisposeNotifierProviderRef<LearnModeState> {
  /// The parameter `initialTerms` of this provider.
  List<Term> get initialTerms;
}

class _LearnModeControllerProviderElement
    extends AutoDisposeNotifierProviderElement<LearnModeController,
        LearnModeState> with LearnModeControllerRef {
  _LearnModeControllerProviderElement(super.provider);

  @override
  List<Term> get initialTerms =>
      (origin as LearnModeControllerProvider).initialTerms;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
