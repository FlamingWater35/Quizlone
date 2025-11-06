// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TestController)
const testControllerProvider = TestControllerProvider._();

final class TestControllerProvider
    extends $AsyncNotifierProvider<TestController, TestScreenState> {
  const TestControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testControllerHash();

  @$internal
  @override
  TestController create() => TestController();
}

String _$testControllerHash() => r'accaaf02c4827e69e210f68cc167348d861a25d8';

abstract class _$TestController extends $AsyncNotifier<TestScreenState> {
  FutureOr<TestScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<TestScreenState>, TestScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TestScreenState>, TestScreenState>,
              AsyncValue<TestScreenState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
