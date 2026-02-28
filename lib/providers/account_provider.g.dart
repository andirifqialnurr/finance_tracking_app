// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountsHash() => r'9dee208cf96d4235c1de3dc7edb5923aaf18fc67';

/// See also [accounts].
@ProviderFor(accounts)
final accountsProvider = AutoDisposeFutureProvider<List<Account>>.internal(
  accounts,
  name: r'accountsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountsRef = AutoDisposeFutureProviderRef<List<Account>>;
String _$accountSummaryHash() => r'0a08c974f6a3eda0a3dd1f5799a763f7ae1aa784';

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

/// See also [accountSummary].
@ProviderFor(accountSummary)
const accountSummaryProvider = AccountSummaryFamily();

/// See also [accountSummary].
class AccountSummaryFamily extends Family<AsyncValue<AccountSummary>> {
  /// See also [accountSummary].
  const AccountSummaryFamily();

  /// See also [accountSummary].
  AccountSummaryProvider call(
    String id,
  ) {
    return AccountSummaryProvider(
      id,
    );
  }

  @override
  AccountSummaryProvider getProviderOverride(
    covariant AccountSummaryProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'accountSummaryProvider';
}

/// See also [accountSummary].
class AccountSummaryProvider extends AutoDisposeFutureProvider<AccountSummary> {
  /// See also [accountSummary].
  AccountSummaryProvider(
    String id,
  ) : this._internal(
          (ref) => accountSummary(
            ref as AccountSummaryRef,
            id,
          ),
          from: accountSummaryProvider,
          name: r'accountSummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountSummaryHash,
          dependencies: AccountSummaryFamily._dependencies,
          allTransitiveDependencies:
              AccountSummaryFamily._allTransitiveDependencies,
          id: id,
        );

  AccountSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<AccountSummary> Function(AccountSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountSummaryProvider._internal(
        (ref) => create(ref as AccountSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AccountSummary> createElement() {
    return _AccountSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountSummaryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountSummaryRef on AutoDisposeFutureProviderRef<AccountSummary> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AccountSummaryProviderElement
    extends AutoDisposeFutureProviderElement<AccountSummary>
    with AccountSummaryRef {
  _AccountSummaryProviderElement(super.provider);

  @override
  String get id => (origin as AccountSummaryProvider).id;
}

String _$accountNotifierHash() => r'7c8ccab4a9173366ea42c721fd15fa8451f248c2';

/// See also [AccountNotifier].
@ProviderFor(AccountNotifier)
final accountNotifierProvider = AutoDisposeNotifierProvider<AccountNotifier,
    AsyncValue<List<Account>>>.internal(
  AccountNotifier.new,
  name: r'accountNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AccountNotifier = AutoDisposeNotifier<AsyncValue<List<Account>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
