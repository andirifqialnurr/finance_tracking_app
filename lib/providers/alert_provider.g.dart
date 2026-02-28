// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$alertsHash() => r'd8fd53c5b40fd12f3cd696a6c345803ff935b0d6';

/// See also [alerts].
@ProviderFor(alerts)
final alertsProvider = AutoDisposeFutureProvider<List<BudgetAlert>>.internal(
  alerts,
  name: r'alertsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$alertsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlertsRef = AutoDisposeFutureProviderRef<List<BudgetAlert>>;
String _$alertNotifierHash() => r'8082de61c235581b5536adc59c97edacce4f158d';

/// See also [AlertNotifier].
@ProviderFor(AlertNotifier)
final alertNotifierProvider = AutoDisposeNotifierProvider<AlertNotifier,
    AsyncValue<BudgetAlert?>>.internal(
  AlertNotifier.new,
  name: r'alertNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alertNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlertNotifier = AutoDisposeNotifier<AsyncValue<BudgetAlert?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
