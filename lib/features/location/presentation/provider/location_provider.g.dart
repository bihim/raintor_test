// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getLocationPermissionHash() =>
    r'a1105b4abbf6121c6c51fcd09fede75701da933e';

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

/// See also [getLocationPermission].
@ProviderFor(getLocationPermission)
const getLocationPermissionProvider = GetLocationPermissionFamily();

/// See also [getLocationPermission].
class GetLocationPermissionFamily extends Family<AsyncValue<bool>> {
  /// See also [getLocationPermission].
  const GetLocationPermissionFamily();

  /// See also [getLocationPermission].
  GetLocationPermissionProvider call({
    required BuildContext context,
  }) {
    return GetLocationPermissionProvider(
      context: context,
    );
  }

  @override
  GetLocationPermissionProvider getProviderOverride(
    covariant GetLocationPermissionProvider provider,
  ) {
    return call(
      context: provider.context,
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
  String? get name => r'getLocationPermissionProvider';
}

/// See also [getLocationPermission].
class GetLocationPermissionProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [getLocationPermission].
  GetLocationPermissionProvider({
    required BuildContext context,
  }) : this._internal(
          (ref) => getLocationPermission(
            ref as GetLocationPermissionRef,
            context: context,
          ),
          from: getLocationPermissionProvider,
          name: r'getLocationPermissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLocationPermissionHash,
          dependencies: GetLocationPermissionFamily._dependencies,
          allTransitiveDependencies:
              GetLocationPermissionFamily._allTransitiveDependencies,
          context: context,
        );

  GetLocationPermissionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<bool> Function(GetLocationPermissionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLocationPermissionProvider._internal(
        (ref) => create(ref as GetLocationPermissionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _GetLocationPermissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLocationPermissionProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetLocationPermissionRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetLocationPermissionProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with GetLocationPermissionRef {
  _GetLocationPermissionProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetLocationPermissionProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
