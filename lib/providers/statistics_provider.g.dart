// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$overviewStatsHash() => r'f92867540ae1656961e819723c455e4e356269ef';

/// See also [overviewStats].
@ProviderFor(overviewStats)
final overviewStatsProvider = AutoDisposeFutureProvider<OverviewStats>.internal(
  overviewStats,
  name: r'overviewStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$overviewStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OverviewStatsRef = AutoDisposeFutureProviderRef<OverviewStats>;
String _$monthlyStatsHash() => r'5254a7a695e3b02b9668717984452f3e10a831e2';

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

/// See also [monthlyStats].
@ProviderFor(monthlyStats)
const monthlyStatsProvider = MonthlyStatsFamily();

/// See also [monthlyStats].
class MonthlyStatsFamily extends Family<AsyncValue<MonthlyStats>> {
  /// See also [monthlyStats].
  const MonthlyStatsFamily();

  /// See also [monthlyStats].
  MonthlyStatsProvider call({
    int? month,
    int? year,
  }) {
    return MonthlyStatsProvider(
      month: month,
      year: year,
    );
  }

  @override
  MonthlyStatsProvider getProviderOverride(
    covariant MonthlyStatsProvider provider,
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
  String? get name => r'monthlyStatsProvider';
}

/// See also [monthlyStats].
class MonthlyStatsProvider extends AutoDisposeFutureProvider<MonthlyStats> {
  /// See also [monthlyStats].
  MonthlyStatsProvider({
    int? month,
    int? year,
  }) : this._internal(
          (ref) => monthlyStats(
            ref as MonthlyStatsRef,
            month: month,
            year: year,
          ),
          from: monthlyStatsProvider,
          name: r'monthlyStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthlyStatsHash,
          dependencies: MonthlyStatsFamily._dependencies,
          allTransitiveDependencies:
              MonthlyStatsFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  MonthlyStatsProvider._internal(
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
    FutureOr<MonthlyStats> Function(MonthlyStatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthlyStatsProvider._internal(
        (ref) => create(ref as MonthlyStatsRef),
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
  AutoDisposeFutureProviderElement<MonthlyStats> createElement() {
    return _MonthlyStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyStatsProvider &&
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

mixin MonthlyStatsRef on AutoDisposeFutureProviderRef<MonthlyStats> {
  /// The parameter `month` of this provider.
  int? get month;

  /// The parameter `year` of this provider.
  int? get year;
}

class _MonthlyStatsProviderElement
    extends AutoDisposeFutureProviderElement<MonthlyStats>
    with MonthlyStatsRef {
  _MonthlyStatsProviderElement(super.provider);

  @override
  int? get month => (origin as MonthlyStatsProvider).month;
  @override
  int? get year => (origin as MonthlyStatsProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
