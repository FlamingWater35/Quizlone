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
String _$cloudSyncServiceHash() => r'1cde2e1e82648e8cb502429393049e78896f571e';

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
String _$instanceIdHash() => r'363777fcb010dc9b7eb84df05bbcb3352d3e5102';

/// See also [instanceId].
@ProviderFor(instanceId)
final instanceIdProvider = Provider<String>.internal(
  instanceId,
  name: r'instanceIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$instanceIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InstanceIdRef = ProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
