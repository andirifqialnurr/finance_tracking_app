// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spendingPatternHash() => r'1486507312cfd60e640cca6ac8814e2a95cf21c0';

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

/// See also [spendingPattern].
@ProviderFor(spendingPattern)
const spendingPatternProvider = SpendingPatternFamily();

/// See also [spendingPattern].
class SpendingPatternFamily extends Family<AsyncValue<SpendingPattern>> {
  /// See also [spendingPattern].
  const SpendingPatternFamily();

  /// See also [spendingPattern].
  SpendingPatternProvider call(
    int month,
    int year,
  ) {
    return SpendingPatternProvider(
      month,
      year,
    );
  }

  @override
  SpendingPatternProvider getProviderOverride(
    covariant SpendingPatternProvider provider,
  ) {
    return call(
      provider.month,
      provider.year,
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
  String? get name => r'spendingPatternProvider';
}

/// See also [spendingPattern].
class SpendingPatternProvider
    extends AutoDisposeFutureProvider<SpendingPattern> {
  /// See also [spendingPattern].
  SpendingPatternProvider(
    int month,
    int year,
  ) : this._internal(
          (ref) => spendingPattern(
            ref as SpendingPatternRef,
            month,
            year,
          ),
          from: spendingPatternProvider,
          name: r'spendingPatternProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$spendingPatternHash,
          dependencies: SpendingPatternFamily._dependencies,
          allTransitiveDependencies:
              SpendingPatternFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  SpendingPatternProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
  }) : super.internal();

  final int month;
  final int year;

  @override
  Override overrideWith(
    FutureOr<SpendingPattern> Function(SpendingPatternRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpendingPatternProvider._internal(
        (ref) => create(ref as SpendingPatternRef),
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
  AutoDisposeFutureProviderElement<SpendingPattern> createElement() {
    return _SpendingPatternProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpendingPatternProvider &&
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

mixin SpendingPatternRef on AutoDisposeFutureProviderRef<SpendingPattern> {
  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;
}

class _SpendingPatternProviderElement
    extends AutoDisposeFutureProviderElement<SpendingPattern>
    with SpendingPatternRef {
  _SpendingPatternProviderElement(super.provider);

  @override
  int get month => (origin as SpendingPatternProvider).month;
  @override
  int get year => (origin as SpendingPatternProvider).year;
}

String _$categoryComparisonHash() =>
    r'dd6cd066159a757ae5255aa39b3e4c18ee6e26db';

/// See also [categoryComparison].
@ProviderFor(categoryComparison)
const categoryComparisonProvider = CategoryComparisonFamily();

/// See also [categoryComparison].
class CategoryComparisonFamily
    extends Family<AsyncValue<List<CategoryComparison>>> {
  /// See also [categoryComparison].
  const CategoryComparisonFamily();

  /// See also [categoryComparison].
  CategoryComparisonProvider call(
    int month,
    int year,
  ) {
    return CategoryComparisonProvider(
      month,
      year,
    );
  }

  @override
  CategoryComparisonProvider getProviderOverride(
    covariant CategoryComparisonProvider provider,
  ) {
    return call(
      provider.month,
      provider.year,
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
  String? get name => r'categoryComparisonProvider';
}

/// See also [categoryComparison].
class CategoryComparisonProvider
    extends AutoDisposeFutureProvider<List<CategoryComparison>> {
  /// See also [categoryComparison].
  CategoryComparisonProvider(
    int month,
    int year,
  ) : this._internal(
          (ref) => categoryComparison(
            ref as CategoryComparisonRef,
            month,
            year,
          ),
          from: categoryComparisonProvider,
          name: r'categoryComparisonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryComparisonHash,
          dependencies: CategoryComparisonFamily._dependencies,
          allTransitiveDependencies:
              CategoryComparisonFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  CategoryComparisonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
  }) : super.internal();

  final int month;
  final int year;

  @override
  Override overrideWith(
    FutureOr<List<CategoryComparison>> Function(CategoryComparisonRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryComparisonProvider._internal(
        (ref) => create(ref as CategoryComparisonRef),
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
  AutoDisposeFutureProviderElement<List<CategoryComparison>> createElement() {
    return _CategoryComparisonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryComparisonProvider &&
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

mixin CategoryComparisonRef
    on AutoDisposeFutureProviderRef<List<CategoryComparison>> {
  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;
}

class _CategoryComparisonProviderElement
    extends AutoDisposeFutureProviderElement<List<CategoryComparison>>
    with CategoryComparisonRef {
  _CategoryComparisonProviderElement(super.provider);

  @override
  int get month => (origin as CategoryComparisonProvider).month;
  @override
  int get year => (origin as CategoryComparisonProvider).year;
}

String _$topSpendingHash() => r'd337d487314c3e71e4e1f361f421c1e0f9b3b0e9';

/// See also [topSpending].
@ProviderFor(topSpending)
const topSpendingProvider = TopSpendingFamily();

/// See also [topSpending].
class TopSpendingFamily extends Family<AsyncValue<List<TopSpendingCategory>>> {
  /// See also [topSpending].
  const TopSpendingFamily();

  /// See also [topSpending].
  TopSpendingProvider call(
    int month,
    int year, {
    int limit = 5,
  }) {
    return TopSpendingProvider(
      month,
      year,
      limit: limit,
    );
  }

  @override
  TopSpendingProvider getProviderOverride(
    covariant TopSpendingProvider provider,
  ) {
    return call(
      provider.month,
      provider.year,
      limit: provider.limit,
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
  String? get name => r'topSpendingProvider';
}

/// See also [topSpending].
class TopSpendingProvider
    extends AutoDisposeFutureProvider<List<TopSpendingCategory>> {
  /// See also [topSpending].
  TopSpendingProvider(
    int month,
    int year, {
    int limit = 5,
  }) : this._internal(
          (ref) => topSpending(
            ref as TopSpendingRef,
            month,
            year,
            limit: limit,
          ),
          from: topSpendingProvider,
          name: r'topSpendingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topSpendingHash,
          dependencies: TopSpendingFamily._dependencies,
          allTransitiveDependencies:
              TopSpendingFamily._allTransitiveDependencies,
          month: month,
          year: year,
          limit: limit,
        );

  TopSpendingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
    required this.limit,
  }) : super.internal();

  final int month;
  final int year;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<TopSpendingCategory>> Function(TopSpendingRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopSpendingProvider._internal(
        (ref) => create(ref as TopSpendingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        year: year,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TopSpendingCategory>> createElement() {
    return _TopSpendingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopSpendingProvider &&
        other.month == month &&
        other.year == year &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopSpendingRef
    on AutoDisposeFutureProviderRef<List<TopSpendingCategory>> {
  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _TopSpendingProviderElement
    extends AutoDisposeFutureProviderElement<List<TopSpendingCategory>>
    with TopSpendingRef {
  _TopSpendingProviderElement(super.provider);

  @override
  int get month => (origin as TopSpendingProvider).month;
  @override
  int get year => (origin as TopSpendingProvider).year;
  @override
  int get limit => (origin as TopSpendingProvider).limit;
}

String _$budgetPerformanceHash() => r'34e947ee032c8add304558b2cde5d48fda29c725';

/// See also [budgetPerformance].
@ProviderFor(budgetPerformance)
const budgetPerformanceProvider = BudgetPerformanceFamily();

/// See also [budgetPerformance].
class BudgetPerformanceFamily extends Family<AsyncValue<BudgetPerformance>> {
  /// See also [budgetPerformance].
  const BudgetPerformanceFamily();

  /// See also [budgetPerformance].
  BudgetPerformanceProvider call(
    int month,
    int year,
  ) {
    return BudgetPerformanceProvider(
      month,
      year,
    );
  }

  @override
  BudgetPerformanceProvider getProviderOverride(
    covariant BudgetPerformanceProvider provider,
  ) {
    return call(
      provider.month,
      provider.year,
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
  String? get name => r'budgetPerformanceProvider';
}

/// See also [budgetPerformance].
class BudgetPerformanceProvider
    extends AutoDisposeFutureProvider<BudgetPerformance> {
  /// See also [budgetPerformance].
  BudgetPerformanceProvider(
    int month,
    int year,
  ) : this._internal(
          (ref) => budgetPerformance(
            ref as BudgetPerformanceRef,
            month,
            year,
          ),
          from: budgetPerformanceProvider,
          name: r'budgetPerformanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetPerformanceHash,
          dependencies: BudgetPerformanceFamily._dependencies,
          allTransitiveDependencies:
              BudgetPerformanceFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  BudgetPerformanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
  }) : super.internal();

  final int month;
  final int year;

  @override
  Override overrideWith(
    FutureOr<BudgetPerformance> Function(BudgetPerformanceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BudgetPerformanceProvider._internal(
        (ref) => create(ref as BudgetPerformanceRef),
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
  AutoDisposeFutureProviderElement<BudgetPerformance> createElement() {
    return _BudgetPerformanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetPerformanceProvider &&
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

mixin BudgetPerformanceRef on AutoDisposeFutureProviderRef<BudgetPerformance> {
  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;
}

class _BudgetPerformanceProviderElement
    extends AutoDisposeFutureProviderElement<BudgetPerformance>
    with BudgetPerformanceRef {
  _BudgetPerformanceProviderElement(super.provider);

  @override
  int get month => (origin as BudgetPerformanceProvider).month;
  @override
  int get year => (origin as BudgetPerformanceProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
