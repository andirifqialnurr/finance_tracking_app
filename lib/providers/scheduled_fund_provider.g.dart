// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_fund_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduledFundsHash() => r'48cc2607babd75e6b975762b833be26a89a02489';

/// See also [scheduledFunds].
@ProviderFor(scheduledFunds)
final scheduledFundsProvider =
    AutoDisposeFutureProvider<List<ScheduledFund>>.internal(
  scheduledFunds,
  name: r'scheduledFundsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduledFundsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ScheduledFundsRef = AutoDisposeFutureProviderRef<List<ScheduledFund>>;
String _$scheduledFundNotifierHash() =>
    r'54a9db33a70b2e472ab93ba7b7934106aeab7541';

/// See also [ScheduledFundNotifier].
@ProviderFor(ScheduledFundNotifier)
final scheduledFundNotifierProvider = AutoDisposeNotifierProvider<
    ScheduledFundNotifier, AsyncValue<void>>.internal(
  ScheduledFundNotifier.new,
  name: r'scheduledFundNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduledFundNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduledFundNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
