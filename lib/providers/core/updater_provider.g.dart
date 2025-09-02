// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updater_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updaterServiceHash() => r'dc32a0887630a4c105a199030c4cac8bec9cfb1e';

/// See also [updaterService].
@ProviderFor(updaterService)
final updaterServiceProvider = AutoDisposeProvider<UpdaterService>.internal(
  updaterService,
  name: r'updaterServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updaterServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdaterServiceRef = AutoDisposeProviderRef<UpdaterService>;
String _$updaterControllerHash() => r'3973aa62a51d39a88132706f11c01281cbfa8247';

/// See also [UpdaterController].
@ProviderFor(UpdaterController)
final updaterControllerProvider =
    AutoDisposeNotifierProvider<UpdaterController, UpdateState>.internal(
      UpdaterController.new,
      name: r'updaterControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$updaterControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UpdaterController = AutoDisposeNotifier<UpdateState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
