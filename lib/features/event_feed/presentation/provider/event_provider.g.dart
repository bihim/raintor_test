// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getEventsHash() => r'3b73592af4911d6b2ef85eea78b1a151584a346a';

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

/// See also [getEvents].
@ProviderFor(getEvents)
const getEventsProvider = GetEventsFamily();

/// See also [getEvents].
class GetEventsFamily extends Family<AsyncValue<List<EventModel>>> {
  /// See also [getEvents].
  const GetEventsFamily();

  /// See also [getEvents].
  GetEventsProvider call({
    required BuildContext context,
  }) {
    return GetEventsProvider(
      context: context,
    );
  }

  @override
  GetEventsProvider getProviderOverride(
    covariant GetEventsProvider provider,
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
  String? get name => r'getEventsProvider';
}

/// See also [getEvents].
class GetEventsProvider extends AutoDisposeFutureProvider<List<EventModel>> {
  /// See also [getEvents].
  GetEventsProvider({
    required BuildContext context,
  }) : this._internal(
          (ref) => getEvents(
            ref as GetEventsRef,
            context: context,
          ),
          from: getEventsProvider,
          name: r'getEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getEventsHash,
          dependencies: GetEventsFamily._dependencies,
          allTransitiveDependencies: GetEventsFamily._allTransitiveDependencies,
          context: context,
        );

  GetEventsProvider._internal(
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
    FutureOr<List<EventModel>> Function(GetEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEventsProvider._internal(
        (ref) => create(ref as GetEventsRef),
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
  AutoDisposeFutureProviderElement<List<EventModel>> createElement() {
    return _GetEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEventsProvider && other.context == context;
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
mixin GetEventsRef on AutoDisposeFutureProviderRef<List<EventModel>> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _GetEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<EventModel>>
    with GetEventsRef {
  _GetEventsProviderElement(super.provider);

  @override
  BuildContext get context => (origin as GetEventsProvider).context;
}

String _$listOfEventsHash() => r'6784b2a71c7d2dff3668bc1b77ad0110108ae14f';

/// See also [ListOfEvents].
@ProviderFor(ListOfEvents)
final listOfEventsProvider =
    AutoDisposeNotifierProvider<ListOfEvents, List<EventModel>?>.internal(
  ListOfEvents.new,
  name: r'listOfEventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listOfEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListOfEvents = AutoDisposeNotifier<List<EventModel>?>;
String _$isLoadingHash() => r'339b55210cef029c24c309953f844f53ec2bf2b3';

/// See also [IsLoading].
@ProviderFor(IsLoading)
final isLoadingProvider = AutoDisposeNotifierProvider<IsLoading, bool>.internal(
  IsLoading.new,
  name: r'isLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsLoading = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
