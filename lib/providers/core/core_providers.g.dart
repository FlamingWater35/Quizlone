// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseServiceHash() => r'1566dd5cd75b4fc13960c1b742b17479bee85902';

/// See also [databaseService].
@ProviderFor(databaseService)
final databaseServiceProvider = Provider<DatabaseService>.internal(
  databaseService,
  name: r'databaseServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$databaseServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseServiceRef = ProviderRef<DatabaseService>;
String _$cloudSyncServiceHash() => r'0dfee3e4d9d77b3c6dc5db9cd88ba92b64787ac6';

/// See also [cloudSyncService].
@ProviderFor(cloudSyncService)
final cloudSyncServiceProvider = AutoDisposeProvider<CloudSyncService>.internal(
  cloudSyncService,
  name: r'cloudSyncServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cloudSyncServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CloudSyncServiceRef = AutoDisposeProviderRef<CloudSyncService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
