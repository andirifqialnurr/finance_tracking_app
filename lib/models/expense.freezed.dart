// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Expense _$ExpenseFromJson(Map<String, dynamic> json) {
  return _Expense.fromJson(json);
}

/// @nodoc
mixin _$Expense {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// ID kategori pengeluaran
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;

  /// ID akun sumber dana — WAJIB (Phase 4)
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCopyWith<Expense> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) then) =
      _$ExpenseCopyWithImpl<$Res, Expense>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String description,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'account_id') String accountId,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$ExpenseCopyWithImpl<$Res, $Val extends Expense>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? description = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ExpenseImplCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$$ExpenseImplCopyWith(
          _$ExpenseImpl value, $Res Function(_$ExpenseImpl) then) =
      __$$ExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String description,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'account_id') String accountId,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$ExpenseImplCopyWithImpl<$Res>
    extends _$ExpenseCopyWithImpl<$Res, _$ExpenseImpl>
    implements _$$ExpenseImplCopyWith<$Res> {
  __$$ExpenseImplCopyWithImpl(
      _$ExpenseImpl _value, $Res Function(_$ExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? description = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ExpenseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
class _$ExpenseImpl implements _Expense {
  const _$ExpenseImpl(
      {required this.id,
      required this.amount,
      required this.description,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'account_id') required this.accountId,
      required this.date,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$ExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final String description;

  /// ID kategori pengeluaran
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;

  /// ID akun sumber dana — WAJIB (Phase 4)
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Expense(id: $id, amount: $amount, description: $description, categoryId: $categoryId, accountId: $accountId, date: $date, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, description,
      categoryId, accountId, date, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      __$$ExpenseImplCopyWithImpl<_$ExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseImplToJson(
      this,
    );
  }
}

abstract class _Expense implements Expense {
  const factory _Expense(
          {required final String id,
          required final double amount,
          required final String description,
          @JsonKey(name: 'category_id') required final String categoryId,
          @JsonKey(name: 'account_id') required final String accountId,
          required final DateTime date,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$ExpenseImpl;

  factory _Expense.fromJson(Map<String, dynamic> json) = _$ExpenseImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get description;
  @override

  /// ID kategori pengeluaran
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override

  /// ID akun sumber dana — WAJIB (Phase 4)
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseImplCopyWith<_$ExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseCreateResult _$ExpenseCreateResultFromJson(Map<String, dynamic> json) {
  return _ExpenseCreateResult.fromJson(json);
}

/// @nodoc
mixin _$ExpenseCreateResult {
  Expense get expense => throw _privateConstructorUsedError;

  /// null → tidak ada warning. Tampilkan SnackBar oranye jika tidak null.
  @JsonKey(name: 'budget_warning')
  String? get budgetWarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCreateResultCopyWith<ExpenseCreateResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCreateResultCopyWith<$Res> {
  factory $ExpenseCreateResultCopyWith(
          ExpenseCreateResult value, $Res Function(ExpenseCreateResult) then) =
      _$ExpenseCreateResultCopyWithImpl<$Res, ExpenseCreateResult>;
  @useResult
  $Res call(
      {Expense expense,
      @JsonKey(name: 'budget_warning') String? budgetWarning});

  $ExpenseCopyWith<$Res> get expense;
}

/// @nodoc
class _$ExpenseCreateResultCopyWithImpl<$Res, $Val extends ExpenseCreateResult>
    implements $ExpenseCreateResultCopyWith<$Res> {
  _$ExpenseCreateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = null,
    Object? budgetWarning = freezed,
  }) {
    return _then(_value.copyWith(
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as Expense,
      budgetWarning: freezed == budgetWarning
          ? _value.budgetWarning
          : budgetWarning // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCopyWith<$Res> get expense {
    return $ExpenseCopyWith<$Res>(_value.expense, (value) {
      return _then(_value.copyWith(expense: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpenseCreateResultImplCopyWith<$Res>
    implements $ExpenseCreateResultCopyWith<$Res> {
  factory _$$ExpenseCreateResultImplCopyWith(_$ExpenseCreateResultImpl value,
          $Res Function(_$ExpenseCreateResultImpl) then) =
      __$$ExpenseCreateResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Expense expense,
      @JsonKey(name: 'budget_warning') String? budgetWarning});

  @override
  $ExpenseCopyWith<$Res> get expense;
}

/// @nodoc
class __$$ExpenseCreateResultImplCopyWithImpl<$Res>
    extends _$ExpenseCreateResultCopyWithImpl<$Res, _$ExpenseCreateResultImpl>
    implements _$$ExpenseCreateResultImplCopyWith<$Res> {
  __$$ExpenseCreateResultImplCopyWithImpl(_$ExpenseCreateResultImpl _value,
      $Res Function(_$ExpenseCreateResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expense = null,
    Object? budgetWarning = freezed,
  }) {
    return _then(_$ExpenseCreateResultImpl(
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as Expense,
      budgetWarning: freezed == budgetWarning
          ? _value.budgetWarning
          : budgetWarning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseCreateResultImpl implements _ExpenseCreateResult {
  const _$ExpenseCreateResultImpl(
      {required this.expense,
      @JsonKey(name: 'budget_warning') this.budgetWarning});

  factory _$ExpenseCreateResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseCreateResultImplFromJson(json);

  @override
  final Expense expense;

  /// null → tidak ada warning. Tampilkan SnackBar oranye jika tidak null.
  @override
  @JsonKey(name: 'budget_warning')
  final String? budgetWarning;

  @override
  String toString() {
    return 'ExpenseCreateResult(expense: $expense, budgetWarning: $budgetWarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseCreateResultImpl &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.budgetWarning, budgetWarning) ||
                other.budgetWarning == budgetWarning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expense, budgetWarning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseCreateResultImplCopyWith<_$ExpenseCreateResultImpl> get copyWith =>
      __$$ExpenseCreateResultImplCopyWithImpl<_$ExpenseCreateResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseCreateResultImplToJson(
      this,
    );
  }
}

abstract class _ExpenseCreateResult implements ExpenseCreateResult {
  const factory _ExpenseCreateResult(
          {required final Expense expense,
          @JsonKey(name: 'budget_warning') final String? budgetWarning}) =
      _$ExpenseCreateResultImpl;

  factory _ExpenseCreateResult.fromJson(Map<String, dynamic> json) =
      _$ExpenseCreateResultImpl.fromJson;

  @override
  Expense get expense;
  @override

  /// null → tidak ada warning. Tampilkan SnackBar oranye jika tidak null.
  @JsonKey(name: 'budget_warning')
  String? get budgetWarning;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseCreateResultImplCopyWith<_$ExpenseCreateResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
