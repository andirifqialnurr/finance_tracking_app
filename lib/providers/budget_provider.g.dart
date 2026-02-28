// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetsHash() => r'd664d7b71689ee5d9aa9935759b0944544e7dc96';

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

/// See also [budgets].
@ProviderFor(budgets)
const budgetsProvider = BudgetsFamily();

/// See also [budgets].
class BudgetsFamily extends Family<AsyncValue<List<BudgetWithCategory>>> {
  /// See also [budgets].
  const BudgetsFamily();

  /// See also [budgets].
  BudgetsProvider call({
    int? month,
    int? year,
  }) {
    return BudgetsProvider(
      month: month,
      year: year,
    );
  }

  @override
  BudgetsProvider getProviderOverride(
    covariant BudgetsProvider provider,
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
  String? get name => r'budgetsProvider';
}

/// See also [budgets].
class BudgetsProvider
    extends AutoDisposeFutureProvider<List<BudgetWithCategory>> {
  /// See also [budgets].
  BudgetsProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => budgets(
            ref as BudgetsRef,
            month: month,
            year: year,
          ),
          from: budgetsProvider,
          name: r'budgetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetsHash,
          dependencies: BudgetsFamily._dependencies,
          allTransitiveDependencies: BudgetsFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  BudgetsProvider._internal(
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
    FutureOr<List<BudgetWithCategory>> Function(BudgetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BudgetsProvider._internal(
        (ref) => create(ref as BudgetsRef),
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
  AutoDisposeFutureProviderElement<List<BudgetWithCategory>> createElement() {
    return _BudgetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetsProvider &&
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

mixin BudgetsRef on AutoDisposeFutureProviderRef<List<BudgetWithCategory>> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _BudgetsProviderElement
    extends AutoDisposeFutureProviderElement<List<BudgetWithCategory>>
    with BudgetsRef {
  _BudgetsProviderElement(super.provider);

  @override
  int? get month => (origin as BudgetsProvider).month;
  @override
  int? get year => (origin as BudgetsProvider).year;
}

String _$budgetSummaryHash() => r'f463eae6e37a3619e7b12363f8b072e147060b41';

/// See also [budgetSummary].
@ProviderFor(budgetSummary)
const budgetSummaryProvider = BudgetSummaryFamily();

/// See also [budgetSummary].
class BudgetSummaryFamily extends Family<AsyncValue<BudgetSummary>> {
  /// See also [budgetSummary].
  const BudgetSummaryFamily();

  /// See also [budgetSummary].
  BudgetSummaryProvider call({
    int? month,
    int? year,
  }) {
    return BudgetSummaryProvider(
      month: month,
      year: year,
    );
  }

  @override
  BudgetSummaryProvider getProviderOverride(
    covariant BudgetSummaryProvider provider,
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
  String? get name => r'budgetSummaryProvider';
}

/// See also [budgetSummary].
class BudgetSummaryProvider extends AutoDisposeFutureProvider<BudgetSummary> {
  /// See also [budgetSummary].
  BudgetSummaryProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => budgetSummary(
            ref as BudgetSummaryRef,
            month: month,
            year: year,
          ),
          from: budgetSummaryProvider,
          name: r'budgetSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetSummaryHash,
          dependencies: BudgetSummaryFamily._dependencies,
          allTransitiveDependencies:
              BudgetSummaryFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  BudgetSummaryProvider._internal(
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
    FutureOr<BudgetSummary> Function(BudgetSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BudgetSummaryProvider._internal(
        (ref) => create(ref as BudgetSummaryRef),
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
  AutoDisposeFutureProviderElement<BudgetSummary> createElement() {
    return _BudgetSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetSummaryProvider &&
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

mixin BudgetSummaryRef on AutoDisposeFutureProviderRef<BudgetSummary> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _BudgetSummaryProviderElement
    extends AutoDisposeFutureProviderElement<BudgetSummary>
    with BudgetSummaryRef {
  _BudgetSummaryProviderElement(super.provider);

  @override
  int? get month => (origin as BudgetSummaryProvider).month;
  @override
  int? get year => (origin as BudgetSummaryProvider).year;
}

String _$budgetReallocationsHash() =>
    r'38862a688f474cab2beab480d7bf277a8eabab5d';

/// See also [budgetReallocations].
@ProviderFor(budgetReallocations)
const budgetReallocationsProvider = BudgetReallocationsFamily();

/// See also [budgetReallocations].
class BudgetReallocationsFamily
    extends Family<AsyncValue<List<BudgetReallocation>>> {
  /// See also [budgetReallocations].
  const BudgetReallocationsFamily();

  /// See also [budgetReallocations].
  BudgetReallocationsProvider call({
    int? month,
    int? year,
  }) {
    return BudgetReallocationsProvider(
      month: month,
      year: year,
    );
  }

  @override
  BudgetReallocationsProvider getProviderOverride(
    covariant BudgetReallocationsProvider provider,
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
  String? get name => r'budgetReallocationsProvider';
}

/// See also [budgetReallocations].
class BudgetReallocationsProvider
    extends AutoDisposeFutureProvider<List<BudgetReallocation>> {
  /// See also [budgetReallocations].
  BudgetReallocationsProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => budgetReallocations(
            ref as BudgetReallocationsRef,
            month: month,
            year: year,
          ),
          from: budgetReallocationsProvider,
          name: r'budgetReallocationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetReallocationsHash,
          dependencies: BudgetReallocationsFamily._dependencies,
          allTransitiveDependencies:
              BudgetReallocationsFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  BudgetReallocationsProvider._internal(
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
    FutureOr<List<BudgetReallocation>> Function(BudgetReallocationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BudgetReallocationsProvider._internal(
        (ref) => create(ref as BudgetReallocationsRef),
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
  AutoDisposeFutureProviderElement<List<BudgetReallocation>> createElement() {
    return _BudgetReallocationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetReallocationsProvider &&
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

mixin BudgetReallocationsRef
    on AutoDisposeFutureProviderRef<List<BudgetReallocation>> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _BudgetReallocationsProviderElement
    extends AutoDisposeFutureProviderElement<List<BudgetReallocation>>
    with BudgetReallocationsRef {
  _BudgetReallocationsProviderElement(super.provider);

  @override
  int? get month => (origin as BudgetReallocationsProvider).month;
  @override
  int? get year => (origin as BudgetReallocationsProvider).year;
}

String _$budgetNotifierHash() => r'f6fca98b9281bb6bb4f2ddd0c5018442891a784e';

/// See also [BudgetNotifier].
@ProviderFor(BudgetNotifier)
final budgetNotifierProvider = AutoDisposeNotifierProvider<BudgetNotifier,
    AsyncValue<BudgetReallocation?>>.internal(
  BudgetNotifier.new,
  name: r'budgetNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$budgetNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BudgetNotifier = AutoDisposeNotifier<AsyncValue<BudgetReallocation?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
