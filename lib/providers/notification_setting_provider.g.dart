// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationSettingsHash() =>
    r'4952764b5992421b9c94bd42252a9b8cc4c22787';

/// See also [notificationSettings].
@ProviderFor(notificationSettings)
final notificationSettingsProvider =
    AutoDisposeFutureProvider<List<NotificationSetting>>.internal(
  notificationSettings,
  name: r'notificationSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationSettingsRef
    = AutoDisposeFutureProviderRef<List<NotificationSetting>>;
String _$notificationSettingNotifierHash() =>
    r'ecd721125b82705598025fdbeb2cbd2f203c2942';

/// See also [NotificationSettingNotifier].
@ProviderFor(NotificationSettingNotifier)
final notificationSettingNotifierProvider = AutoDisposeNotifierProvider<
    NotificationSettingNotifier, AsyncValue<void>>.internal(
  NotificationSettingNotifier.new,
  name: r'notificationSettingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationSettingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationSettingNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
