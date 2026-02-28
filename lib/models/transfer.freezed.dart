// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transfer _$TransferFromJson(Map<String, dynamic> json) {
  return _Transfer.fromJson(json);
}

/// @nodoc
mixin _$Transfer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_account_id')
  String get fromAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_account_id')
  String get toAccountId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_date')
  DateTime get transferDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferCopyWith<Transfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) then) =
      _$TransferCopyWithImpl<$Res, Transfer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'from_account_id') String fromAccountId,
      @JsonKey(name: 'to_account_id') String toAccountId,
      double amount,
      String? note,
      @JsonKey(name: 'transfer_date') DateTime transferDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$TransferCopyWithImpl<$Res, $Val extends Transfer>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromAccountId = null,
    Object? toAccountId = null,
    Object? amount = null,
    Object? note = freezed,
    Object? transferDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromAccountId: null == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      toAccountId: null == toAccountId
          ? _value.toAccountId
          : toAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: null == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferImplCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$$TransferImplCopyWith(
          _$TransferImpl value, $Res Function(_$TransferImpl) then) =
      __$$TransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'from_account_id') String fromAccountId,
      @JsonKey(name: 'to_account_id') String toAccountId,
      double amount,
      String? note,
      @JsonKey(name: 'transfer_date') DateTime transferDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$TransferImplCopyWithImpl<$Res>
    extends _$TransferCopyWithImpl<$Res, _$TransferImpl>
    implements _$$TransferImplCopyWith<$Res> {
  __$$TransferImplCopyWithImpl(
      _$TransferImpl _value, $Res Function(_$TransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromAccountId = null,
    Object? toAccountId = null,
    Object? amount = null,
    Object? note = freezed,
    Object? transferDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TransferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromAccountId: null == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      toAccountId: null == toAccountId
          ? _value.toAccountId
          : toAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: null == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferImpl implements _Transfer {
  const _$TransferImpl(
      {required this.id,
      @JsonKey(name: 'from_account_id') required this.fromAccountId,
      @JsonKey(name: 'to_account_id') required this.toAccountId,
      required this.amount,
      this.note,
      @JsonKey(name: 'transfer_date') required this.transferDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$TransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'from_account_id')
  final String fromAccountId;
  @override
  @JsonKey(name: 'to_account_id')
  final String toAccountId;
  @override
  final double amount;
  @override
  final String? note;
  @override
  @JsonKey(name: 'transfer_date')
  final DateTime transferDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Transfer(id: $id, fromAccountId: $fromAccountId, toAccountId: $toAccountId, amount: $amount, note: $note, transferDate: $transferDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fromAccountId, fromAccountId) ||
                other.fromAccountId == fromAccountId) &&
            (identical(other.toAccountId, toAccountId) ||
                other.toAccountId == toAccountId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.transferDate, transferDate) ||
                other.transferDate == transferDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fromAccountId, toAccountId,
      amount, note, transferDate, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      __$$TransferImplCopyWithImpl<_$TransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferImplToJson(
      this,
    );
  }
}

abstract class _Transfer implements Transfer {
  const factory _Transfer(
          {required final String id,
          @JsonKey(name: 'from_account_id') required final String fromAccountId,
          @JsonKey(name: 'to_account_id') required final String toAccountId,
          required final double amount,
          final String? note,
          @JsonKey(name: 'transfer_date') required final DateTime transferDate,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$TransferImpl;

  factory _Transfer.fromJson(Map<String, dynamic> json) =
      _$TransferImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'from_account_id')
  String get fromAccountId;
  @override
  @JsonKey(name: 'to_account_id')
  String get toAccountId;
  @override
  double get amount;
  @override
  String? get note;
  @override
  @JsonKey(name: 'transfer_date')
  DateTime get transferDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TransferImplCopyWith<_$TransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransferResult _$TransferResultFromJson(Map<String, dynamic> json) {
  return _TransferResult.fromJson(json);
}

/// @nodoc
mixin _$TransferResult {
  Transfer get transfer => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_account_balance')
  double get fromAccountBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_account_balance')
  double get toAccountBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferResultCopyWith<TransferResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferResultCopyWith<$Res> {
  factory $TransferResultCopyWith(
          TransferResult value, $Res Function(TransferResult) then) =
      _$TransferResultCopyWithImpl<$Res, TransferResult>;
  @useResult
  $Res call(
      {Transfer transfer,
      @JsonKey(name: 'from_account_balance') double fromAccountBalance,
      @JsonKey(name: 'to_account_balance') double toAccountBalance});

  $TransferCopyWith<$Res> get transfer;
}

/// @nodoc
class _$TransferResultCopyWithImpl<$Res, $Val extends TransferResult>
    implements $TransferResultCopyWith<$Res> {
  _$TransferResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfer = null,
    Object? fromAccountBalance = null,
    Object? toAccountBalance = null,
  }) {
    return _then(_value.copyWith(
      transfer: null == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as Transfer,
      fromAccountBalance: null == fromAccountBalance
          ? _value.fromAccountBalance
          : fromAccountBalance // ignore: cast_nullable_to_non_nullable
              as double,
      toAccountBalance: null == toAccountBalance
          ? _value.toAccountBalance
          : toAccountBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransferCopyWith<$Res> get transfer {
    return $TransferCopyWith<$Res>(_value.transfer, (value) {
      return _then(_value.copyWith(transfer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferResultImplCopyWith<$Res>
    implements $TransferResultCopyWith<$Res> {
  factory _$$TransferResultImplCopyWith(_$TransferResultImpl value,
          $Res Function(_$TransferResultImpl) then) =
      __$$TransferResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Transfer transfer,
      @JsonKey(name: 'from_account_balance') double fromAccountBalance,
      @JsonKey(name: 'to_account_balance') double toAccountBalance});

  @override
  $TransferCopyWith<$Res> get transfer;
}

/// @nodoc
class __$$TransferResultImplCopyWithImpl<$Res>
    extends _$TransferResultCopyWithImpl<$Res, _$TransferResultImpl>
    implements _$$TransferResultImplCopyWith<$Res> {
  __$$TransferResultImplCopyWithImpl(
      _$TransferResultImpl _value, $Res Function(_$TransferResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfer = null,
    Object? fromAccountBalance = null,
    Object? toAccountBalance = null,
  }) {
    return _then(_$TransferResultImpl(
      transfer: null == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as Transfer,
      fromAccountBalance: null == fromAccountBalance
          ? _value.fromAccountBalance
          : fromAccountBalance // ignore: cast_nullable_to_non_nullable
              as double,
      toAccountBalance: null == toAccountBalance
          ? _value.toAccountBalance
          : toAccountBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferResultImpl implements _TransferResult {
  const _$TransferResultImpl(
      {required this.transfer,
      @JsonKey(name: 'from_account_balance') required this.fromAccountBalance,
      @JsonKey(name: 'to_account_balance') required this.toAccountBalance});

  factory _$TransferResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferResultImplFromJson(json);

  @override
  final Transfer transfer;
  @override
  @JsonKey(name: 'from_account_balance')
  final double fromAccountBalance;
  @override
  @JsonKey(name: 'to_account_balance')
  final double toAccountBalance;

  @override
  String toString() {
    return 'TransferResult(transfer: $transfer, fromAccountBalance: $fromAccountBalance, toAccountBalance: $toAccountBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferResultImpl &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer) &&
            (identical(other.fromAccountBalance, fromAccountBalance) ||
                other.fromAccountBalance == fromAccountBalance) &&
            (identical(other.toAccountBalance, toAccountBalance) ||
                other.toAccountBalance == toAccountBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transfer, fromAccountBalance, toAccountBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferResultImplCopyWith<_$TransferResultImpl> get copyWith =>
      __$$TransferResultImplCopyWithImpl<_$TransferResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferResultImplToJson(
      this,
    );
  }
}

abstract class _TransferResult implements TransferResult {
  const factory _TransferResult(
      {required final Transfer transfer,
      @JsonKey(name: 'from_account_balance')
      required final double fromAccountBalance,
      @JsonKey(name: 'to_account_balance')
      required final double toAccountBalance}) = _$TransferResultImpl;

  factory _TransferResult.fromJson(Map<String, dynamic> json) =
      _$TransferResultImpl.fromJson;

  @override
  Transfer get transfer;
  @override
  @JsonKey(name: 'from_account_balance')
  double get fromAccountBalance;
  @override
  @JsonKey(name: 'to_account_balance')
  double get toAccountBalance;
  @override
  @JsonKey(ignore: true)
  _$$TransferResultImplCopyWith<_$TransferResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
