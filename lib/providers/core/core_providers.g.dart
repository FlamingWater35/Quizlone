// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(databaseService)
const databaseServiceProvider = DatabaseServiceProvider._();

final class DatabaseServiceProvider
    extends
        $FunctionalProvider<DatabaseService, DatabaseService, DatabaseService>
    with $Provider<DatabaseService> {
  const DatabaseServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseServiceHash();

  @$internal
  @override
  $ProviderElement<DatabaseService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DatabaseService create(Ref ref) {
    return databaseService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DatabaseService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DatabaseService>(value),
    );
  }
}

String _$databaseServiceHash() => r'1566dd5cd75b4fc13960c1b742b17479bee85902';

@ProviderFor(cloudSyncService)
const cloudSyncServiceProvider = CloudSyncServiceProvider._();

final class CloudSyncServiceProvider
    extends
        $FunctionalProvider<
          CloudSyncService,
          CloudSyncService,
          CloudSyncService
        >
    with $Provider<CloudSyncService> {
  const CloudSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cloudSyncServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cloudSyncServiceHash();

  @$internal
  @override
  $ProviderElement<CloudSyncService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CloudSyncService create(Ref ref) {
    return cloudSyncService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CloudSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CloudSyncService>(value),
    );
  }
}

String _$cloudSyncServiceHash() => r'1cde2e1e82648e8cb502429393049e78896f571e';

@ProviderFor(instanceId)
const instanceIdProvider = InstanceIdProvider._();

final class InstanceIdProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const InstanceIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'instanceIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$instanceIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return instanceId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$instanceIdHash() => r'363777fcb010dc9b7eb84df05bbcb3352d3e5102';
