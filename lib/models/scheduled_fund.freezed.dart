// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_fund.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduledFund _$ScheduledFundFromJson(Map<String, dynamic> json) {
  return _ScheduledFund.fromJson(json);
}

/// @nodoc
mixin _$ScheduledFund {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_account_id')
  String? get fromAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_type')
  String get scheduleType => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_month')
  int get dayOfMonth => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_executed_at')
  DateTime? get lastExecutedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_execute_at')
  DateTime? get nextExecuteAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduledFundCopyWith<ScheduledFund> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledFundCopyWith<$Res> {
  factory $ScheduledFundCopyWith(
          ScheduledFund value, $Res Function(ScheduledFund) then) =
      _$ScheduledFundCopyWithImpl<$Res, ScheduledFund>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      @JsonKey(name: 'from_account_id') String? fromAccountId,
      @JsonKey(name: 'schedule_type') String scheduleType,
      double amount,
      @JsonKey(name: 'day_of_month') int dayOfMonth,
      String? description,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'last_executed_at') DateTime? lastExecutedAt,
      @JsonKey(name: 'next_execute_at') DateTime? nextExecuteAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ScheduledFundCopyWithImpl<$Res, $Val extends ScheduledFund>
    implements $ScheduledFundCopyWith<$Res> {
  _$ScheduledFundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? fromAccountId = freezed,
    Object? scheduleType = null,
    Object? amount = null,
    Object? dayOfMonth = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? lastExecutedAt = freezed,
    Object? nextExecuteAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      fromAccountId: freezed == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dayOfMonth: null == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastExecutedAt: freezed == lastExecutedAt
          ? _value.lastExecutedAt
          : lastExecutedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextExecuteAt: freezed == nextExecuteAt
          ? _value.nextExecuteAt
          : nextExecuteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduledFundImplCopyWith<$Res>
    implements $ScheduledFundCopyWith<$Res> {
  factory _$$ScheduledFundImplCopyWith(
          _$ScheduledFundImpl value, $Res Function(_$ScheduledFundImpl) then) =
      __$$ScheduledFundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'account_id') String accountId,
      @JsonKey(name: 'from_account_id') String? fromAccountId,
      @JsonKey(name: 'schedule_type') String scheduleType,
      double amount,
      @JsonKey(name: 'day_of_month') int dayOfMonth,
      String? description,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'last_executed_at') DateTime? lastExecutedAt,
      @JsonKey(name: 'next_execute_at') DateTime? nextExecuteAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ScheduledFundImplCopyWithImpl<$Res>
    extends _$ScheduledFundCopyWithImpl<$Res, _$ScheduledFundImpl>
    implements _$$ScheduledFundImplCopyWith<$Res> {
  __$$ScheduledFundImplCopyWithImpl(
      _$ScheduledFundImpl _value, $Res Function(_$ScheduledFundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? fromAccountId = freezed,
    Object? scheduleType = null,
    Object? amount = null,
    Object? dayOfMonth = null,
    Object? description = freezed,
    Object? isActive = null,
    Object? lastExecutedAt = freezed,
    Object? nextExecuteAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ScheduledFundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      fromAccountId: freezed == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleType: null == scheduleType
          ? _value.scheduleType
          : scheduleType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dayOfMonth: null == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastExecutedAt: freezed == lastExecutedAt
          ? _value.lastExecutedAt
          : lastExecutedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextExecuteAt: freezed == nextExecuteAt
          ? _value.nextExecuteAt
          : nextExecuteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduledFundImpl implements _ScheduledFund {
  const _$ScheduledFundImpl(
      {required this.id,
      @JsonKey(name: 'account_id') required this.accountId,
      @JsonKey(name: 'from_account_id') this.fromAccountId,
      @JsonKey(name: 'schedule_type') required this.scheduleType,
      required this.amount,
      @JsonKey(name: 'day_of_month') required this.dayOfMonth,
      this.description,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'last_executed_at') this.lastExecutedAt,
      @JsonKey(name: 'next_execute_at') this.nextExecuteAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ScheduledFundImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledFundImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey(name: 'from_account_id')
  final String? fromAccountId;
  @override
  @JsonKey(name: 'schedule_type')
  final String scheduleType;
  @override
  final double amount;
  @override
  @JsonKey(name: 'day_of_month')
  final int dayOfMonth;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'last_executed_at')
  final DateTime? lastExecutedAt;
  @override
  @JsonKey(name: 'next_execute_at')
  final DateTime? nextExecuteAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ScheduledFund(id: $id, accountId: $accountId, fromAccountId: $fromAccountId, scheduleType: $scheduleType, amount: $amount, dayOfMonth: $dayOfMonth, description: $description, isActive: $isActive, lastExecutedAt: $lastExecutedAt, nextExecuteAt: $nextExecuteAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledFundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.fromAccountId, fromAccountId) ||
                other.fromAccountId == fromAccountId) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.dayOfMonth, dayOfMonth) ||
                other.dayOfMonth == dayOfMonth) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastExecutedAt, lastExecutedAt) ||
                other.lastExecutedAt == lastExecutedAt) &&
            (identical(other.nextExecuteAt, nextExecuteAt) ||
                other.nextExecuteAt == nextExecuteAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      fromAccountId,
      scheduleType,
      amount,
      dayOfMonth,
      description,
      isActive,
      lastExecutedAt,
      nextExecuteAt,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledFundImplCopyWith<_$ScheduledFundImpl> get copyWith =>
      __$$ScheduledFundImplCopyWithImpl<_$ScheduledFundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledFundImplToJson(
      this,
    );
  }
}

abstract class _ScheduledFund implements ScheduledFund {
  const factory _ScheduledFund(
          {required final String id,
          @JsonKey(name: 'account_id') required final String accountId,
          @JsonKey(name: 'from_account_id') final String? fromAccountId,
          @JsonKey(name: 'schedule_type') required final String scheduleType,
          required final double amount,
          @JsonKey(name: 'day_of_month') required final int dayOfMonth,
          final String? description,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'last_executed_at') final DateTime? lastExecutedAt,
          @JsonKey(name: 'next_execute_at') final DateTime? nextExecuteAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$ScheduledFundImpl;

  factory _ScheduledFund.fromJson(Map<String, dynamic> json) =
      _$ScheduledFundImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  @JsonKey(name: 'from_account_id')
  String? get fromAccountId;
  @override
  @JsonKey(name: 'schedule_type')
  String get scheduleType;
  @override
  double get amount;
  @override
  @JsonKey(name: 'day_of_month')
  int get dayOfMonth;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'last_executed_at')
  DateTime? get lastExecutedAt;
  @override
  @JsonKey(name: 'next_execute_at')
  DateTime? get nextExecuteAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ScheduledFundImplCopyWith<_$ScheduledFundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
