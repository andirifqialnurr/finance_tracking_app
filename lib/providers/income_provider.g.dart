// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incomesHash() => r'df3622b9cd78b328b69e7244f7c7105b123c7f44';

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

/// See also [incomes].
@ProviderFor(incomes)
const incomesProvider = IncomesFamily();

/// See also [incomes].
class IncomesFamily extends Family<AsyncValue<List<Income>>> {
  /// See also [incomes].
  const IncomesFamily();

  /// See also [incomes].
  IncomesProvider call({
    int? month,
    int? year,
  }) {
    return IncomesProvider(
      month: month,
      year: year,
    );
  }

  @override
  IncomesProvider getProviderOverride(
    covariant IncomesProvider provider,
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
  String? get name => r'incomesProvider';
}

/// See also [incomes].
class IncomesProvider extends AutoDisposeFutureProvider<List<Income>> {
  /// See also [incomes].
  IncomesProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => incomes(
            ref as IncomesRef,
            month: month,
            year: year,
          ),
          from: incomesProvider,
          name: r'incomesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$incomesHash,
          dependencies: IncomesFamily._dependencies,
          allTransitiveDependencies: IncomesFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  IncomesProvider._internal(
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
    FutureOr<List<Income>> Function(IncomesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IncomesProvider._internal(
        (ref) => create(ref as IncomesRef),
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
  AutoDisposeFutureProviderElement<List<Income>> createElement() {
    return _IncomesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IncomesProvider &&
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

mixin IncomesRef on AutoDisposeFutureProviderRef<List<Income>> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _IncomesProviderElement
    extends AutoDisposeFutureProviderElement<List<Income>> with IncomesRef {
  _IncomesProviderElement(super.provider);

  @override
  int? get month => (origin as IncomesProvider).month;
  @override
  int? get year => (origin as IncomesProvider).year;
}

String _$incomeNotifierHash() => r'e104d4e8f367c81857599334f6693e6c8c9ad8cd';

/// See also [IncomeNotifier].
@ProviderFor(IncomeNotifier)
final incomeNotifierProvider = AutoDisposeNotifierProvider<IncomeNotifier,
    AsyncValue<IncomeCreateResult?>>.internal(
  IncomeNotifier.new,
  name: r'incomeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$incomeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IncomeNotifier = AutoDisposeNotifier<AsyncValue<IncomeCreateResult?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
