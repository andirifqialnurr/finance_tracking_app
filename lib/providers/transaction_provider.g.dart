// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsHash() => r'958068a1881be3eea4427a6ddf876034485c9f5b';

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

/// See also [transactions].
@ProviderFor(transactions)
const transactionsProvider = TransactionsFamily();

/// See also [transactions].
class TransactionsFamily extends Family<AsyncValue<List<Transaction>>> {
  /// See also [transactions].
  const TransactionsFamily();

  /// See also [transactions].
  TransactionsProvider call({
    int? month,
    int? year,
    String? accountId,
    String? type,
    int? limit,
  }) {
    return TransactionsProvider(
      month: month,
      year: year,
      accountId: accountId,
      type: type,
      limit: limit,
    );
  }

  @override
  TransactionsProvider getProviderOverride(
    covariant TransactionsProvider provider,
  ) {
    return call(
      month: provider.month,
      year: provider.year,
      accountId: provider.accountId,
      type: provider.type,
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
  String? get name => r'transactionsProvider';
}

/// See also [transactions].
class TransactionsProvider
    extends AutoDisposeFutureProvider<List<Transaction>> {
  /// See also [transactions].
  TransactionsProvider({
    int? month,
    int? year,
    String? accountId,
    String? type,
    int? limit,
  }) : this._internal(
          (ref) => transactions(
            ref as TransactionsRef,
            month: month,
            year: year,
            accountId: accountId,
            type: type,
            limit: limit,
          ),
          from: transactionsProvider,
          name: r'transactionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsHash,
          dependencies: TransactionsFamily._dependencies,
          allTransitiveDependencies:
              TransactionsFamily._allTransitiveDependencies,
          month: month,
          year: year,
          accountId: accountId,
          type: type,
          limit: limit,
        );

  TransactionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
    required this.accountId,
    required this.type,
    required this.limit,
  }) : super.internal();

  final int? month;
  final int? year;
  final String? accountId;
  final String? type;
  final int? limit;

  @override
  Override overrideWith(
    FutureOr<List<Transaction>> Function(TransactionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionsProvider._internal(
        (ref) => create(ref as TransactionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        year: year,
        accountId: accountId,
        type: type,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Transaction>> createElement() {
    return _TransactionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsProvider &&
        other.month == month &&
        other.year == year &&
        other.accountId == accountId &&
        other.type == type &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransactionsRef on AutoDisposeFutureProviderRef<List<Transaction>> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;

  /// The parameter `accountId` of this provider.
  String? get accountId;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `limit` of this provider.
  int? get limit;
}

class _TransactionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Transaction>>
    with TransactionsRef {
  _TransactionsProviderElement(super.provider);

  @override
  int? get month => (origin as TransactionsProvider).month;
  @override
  int? get year => (origin as TransactionsProvider).year;
  @override
  String? get accountId => (origin as TransactionsProvider).accountId;
  @override
  String? get type => (origin as TransactionsProvider).type;
  @override
  int? get limit => (origin as TransactionsProvider).limit;
}

String _$transactionSummaryHash() =>
    r'9743828cb95aea1daf401734f8748bb76d53f76d';

/// See also [transactionSummary].
@ProviderFor(transactionSummary)
const transactionSummaryProvider = TransactionSummaryFamily();

/// See also [transactionSummary].
class TransactionSummaryFamily extends Family<AsyncValue<TransactionSummary>> {
  /// See also [transactionSummary].
  const TransactionSummaryFamily();

  /// See also [transactionSummary].
  TransactionSummaryProvider call({
    int? month,
    int? year,
  }) {
    return TransactionSummaryProvider(
      month: month,
      year: year,
    );
  }

  @override
  TransactionSummaryProvider getProviderOverride(
    covariant TransactionSummaryProvider provider,
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
  String? get name => r'transactionSummaryProvider';
}

/// See also [transactionSummary].
class TransactionSummaryProvider
    extends AutoDisposeFutureProvider<TransactionSummary> {
  /// See also [transactionSummary].
  TransactionSummaryProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => transactionSummary(
            ref as TransactionSummaryRef,
            month: month,
            year: year,
          ),
          from: transactionSummaryProvider,
          name: r'transactionSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionSummaryHash,
          dependencies: TransactionSummaryFamily._dependencies,
          allTransitiveDependencies:
              TransactionSummaryFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  TransactionSummaryProvider._internal(
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
    FutureOr<TransactionSummary> Function(TransactionSummaryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionSummaryProvider._internal(
        (ref) => create(ref as TransactionSummaryRef),
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
  AutoDisposeFutureProviderElement<TransactionSummary> createElement() {
    return _TransactionSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionSummaryProvider &&
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

mixin TransactionSummaryRef
    on AutoDisposeFutureProviderRef<TransactionSummary> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _TransactionSummaryProviderElement
    extends AutoDisposeFutureProviderElement<TransactionSummary>
    with TransactionSummaryRef {
  _TransactionSummaryProviderElement(super.provider);

  @override
  int? get month => (origin as TransactionSummaryProvider).month;
  @override
  int? get year => (origin as TransactionSummaryProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
