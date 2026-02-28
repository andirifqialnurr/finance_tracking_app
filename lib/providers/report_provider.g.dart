// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthlyReportHash() => r'f81e883a52946075064ef1b873eca2a093da0852';

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

/// See also [monthlyReport].
@ProviderFor(monthlyReport)
const monthlyReportProvider = MonthlyReportFamily();

/// See also [monthlyReport].
class MonthlyReportFamily extends Family<AsyncValue<MonthlyReport>> {
  /// See also [monthlyReport].
  const MonthlyReportFamily();

  /// See also [monthlyReport].
  MonthlyReportProvider call(
    int month,
    int year,
  ) {
    return MonthlyReportProvider(
      month,
      year,
    );
  }

  @override
  MonthlyReportProvider getProviderOverride(
    covariant MonthlyReportProvider provider,
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
  String? get name => r'monthlyReportProvider';
}

/// See also [monthlyReport].
class MonthlyReportProvider extends AutoDisposeFutureProvider<MonthlyReport> {
  /// See also [monthlyReport].
  MonthlyReportProvider(
    int month,
    int year,
  ) : this._internal(
          (ref) => monthlyReport(
            ref as MonthlyReportRef,
            month,
            year,
          ),
          from: monthlyReportProvider,
          name: r'monthlyReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthlyReportHash,
          dependencies: MonthlyReportFamily._dependencies,
          allTransitiveDependencies:
              MonthlyReportFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  MonthlyReportProvider._internal(
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
    FutureOr<MonthlyReport> Function(MonthlyReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthlyReportProvider._internal(
        (ref) => create(ref as MonthlyReportRef),
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
  AutoDisposeFutureProviderElement<MonthlyReport> createElement() {
    return _MonthlyReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlyReportProvider &&
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

mixin MonthlyReportRef on AutoDisposeFutureProviderRef<MonthlyReport> {
  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;
}

class _MonthlyReportProviderElement
    extends AutoDisposeFutureProviderElement<MonthlyReport>
    with MonthlyReportRef {
  _MonthlyReportProviderElement(super.provider);

  @override
  int get month => (origin as MonthlyReportProvider).month;
  @override
  int get year => (origin as MonthlyReportProvider).year;
}

String _$yearlyReportHash() => r'd1f5fb21a40a88d0f192e5cc067c14768f4e8f1e';

/// See also [yearlyReport].
@ProviderFor(yearlyReport)
const yearlyReportProvider = YearlyReportFamily();

/// See also [yearlyReport].
class YearlyReportFamily extends Family<AsyncValue<YearlyReport>> {
  /// See also [yearlyReport].
  const YearlyReportFamily();

  /// See also [yearlyReport].
  YearlyReportProvider call(
    int year,
  ) {
    return YearlyReportProvider(
      year,
    );
  }

  @override
  YearlyReportProvider getProviderOverride(
    covariant YearlyReportProvider provider,
  ) {
    return call(
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
  String? get name => r'yearlyReportProvider';
}

/// See also [yearlyReport].
class YearlyReportProvider extends AutoDisposeFutureProvider<YearlyReport> {
  /// See also [yearlyReport].
  YearlyReportProvider(
    int year,
  ) : this._internal(
          (ref) => yearlyReport(
            ref as YearlyReportRef,
            year,
          ),
          from: yearlyReportProvider,
          name: r'yearlyReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$yearlyReportHash,
          dependencies: YearlyReportFamily._dependencies,
          allTransitiveDependencies:
              YearlyReportFamily._allTransitiveDependencies,
          year: year,
        );

  YearlyReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final int year;

  @override
  Override overrideWith(
    FutureOr<YearlyReport> Function(YearlyReportRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YearlyReportProvider._internal(
        (ref) => create(ref as YearlyReportRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<YearlyReport> createElement() {
    return _YearlyReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YearlyReportProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YearlyReportRef on AutoDisposeFutureProviderRef<YearlyReport> {
  /// The parameter `year` of this provider.
  int get year;
}

class _YearlyReportProviderElement
    extends AutoDisposeFutureProviderElement<YearlyReport>
    with YearlyReportRef {
  _YearlyReportProviderElement(super.provider);

  @override
  int get year => (origin as YearlyReportProvider).year;
}

String _$reportExportNotifierHash() =>
    r'356ae74c25ecd21f580827f3f7bcb28965577c38';

/// See also [ReportExportNotifier].
@ProviderFor(ReportExportNotifier)
final reportExportNotifierProvider = AutoDisposeNotifierProvider<
    ReportExportNotifier, AsyncValue<Uint8List?>>.internal(
  ReportExportNotifier.new,
  name: r'reportExportNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportExportNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReportExportNotifier = AutoDisposeNotifier<AsyncValue<Uint8List?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
