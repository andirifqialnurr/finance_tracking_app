// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transfersHash() => r'240e903b1ed9169ae7cedf40dda3cd78151610d4';

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

/// See also [transfers].
@ProviderFor(transfers)
const transfersProvider = TransfersFamily();

/// See also [transfers].
class TransfersFamily extends Family<AsyncValue<List<Transfer>>> {
  /// See also [transfers].
  const TransfersFamily();

  /// See also [transfers].
  TransfersProvider call({
    int? month,
    int? year,
  }) {
    return TransfersProvider(
      month: month,
      year: year,
    );
  }

  @override
  TransfersProvider getProviderOverride(
    covariant TransfersProvider provider,
  ) {
    return call(
      month: provider.month,
      year: provider.year,
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
  String? get name => r'transfersProvider';
}

/// See also [transfers].
class TransfersProvider extends AutoDisposeFutureProvider<List<Transfer>> {
  /// See also [transfers].
  TransfersProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => transfers(
            ref as TransfersRef,
            month: month,
            year: year,
          ),
          from: transfersProvider,
          name: r'transfersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transfersHash,
          dependencies: TransfersFamily._dependencies,
          allTransitiveDependencies: TransfersFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  TransfersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
  }) : super.internal();

  final int? month;
  final int? year;

  @override
  Override overrideWith(
    FutureOr<List<Transfer>> Function(TransfersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransfersProvider._internal(
        (ref) => create(ref as TransfersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Transfer>> createElement() {
    return _TransfersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransfersProvider &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransfersRef on AutoDisposeFutureProviderRef<List<Transfer>> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _TransfersProviderElement
    extends AutoDisposeFutureProviderElement<List<Transfer>> with TransfersRef {
  _TransfersProviderElement(super.provider);

  @override
  int? get month => (origin as TransfersProvider).month;
  @override
  int? get year => (origin as TransfersProvider).year;
}

String _$transferNotifierHash() => r'7397f25766ae857caf3ea5519a3a0c58daeebd19';

/// See also [TransferNotifier].
@ProviderFor(TransferNotifier)
final transferNotifierProvider =
    AutoDisposeNotifierProvider<TransferNotifier, AsyncValue<void>>.internal(
  TransferNotifier.new,
  name: r'transferNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transferNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
