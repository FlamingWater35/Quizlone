// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$matchTimerHash() => r'8294ec6124c700c6e38bb1dfa6c5303e039020b7';

/// See also [MatchTimer].
@ProviderFor(MatchTimer)
final matchTimerProvider = NotifierProvider<MatchTimer, String>.internal(
  MatchTimer.new,
  name: r'matchTimerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$matchTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MatchTimer = Notifier<String>;
String _$matchControllerHash() => r'c88617a8c609c32186dd6244de6c74e3866e779e';

/// See also [MatchController].
@ProviderFor(MatchController)
final matchControllerProvider = AutoDisposeAsyncNotifierProvider<
  MatchController,
  MatchScreenState
>.internal(
  MatchController.new,
  name: r'matchControllerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$matchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MatchController = AutoDisposeAsyncNotifier<MatchScreenState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
