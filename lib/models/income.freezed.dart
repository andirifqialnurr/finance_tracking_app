// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Income _$IncomeFromJson(Map<String, dynamic> json) {
  return _Income.fromJson(json);
}

/// @nodoc
mixin _$Income {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// ID akun yang menerima pemasukan ini — WAJIB (Phase 4)
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCopyWith<Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) then) =
      _$IncomeCopyWithImpl<$Res, Income>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String source,
      String? description,
      @JsonKey(name: 'account_id') String accountId,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res, $Val extends Income>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? source = null,
    Object? description = freezed,
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
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$IncomeImplCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$$IncomeImplCopyWith(
          _$IncomeImpl value, $Res Function(_$IncomeImpl) then) =
      __$$IncomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String source,
      String? description,
      @JsonKey(name: 'account_id') String accountId,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$IncomeImplCopyWithImpl<$Res>
    extends _$IncomeCopyWithImpl<$Res, _$IncomeImpl>
    implements _$$IncomeImplCopyWith<$Res> {
  __$$IncomeImplCopyWithImpl(
      _$IncomeImpl _value, $Res Function(_$IncomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? source = null,
    Object? description = freezed,
    Object? accountId = null,
    Object? date = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$IncomeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$IncomeImpl implements _Income {
  const _$IncomeImpl(
      {required this.id,
      required this.amount,
      required this.source,
      this.description,
      @JsonKey(name: 'account_id') required this.accountId,
      required this.date,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$IncomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final String source;
  @override
  final String? description;

  /// ID akun yang menerima pemasukan ini — WAJIB (Phase 4)
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
    return 'Income(id: $id, amount: $amount, source: $source, description: $description, accountId: $accountId, date: $date, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
  int get hashCode => Object.hash(runtimeType, id, amount, source, description,
      accountId, date, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      __$$IncomeImplCopyWithImpl<_$IncomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeImplToJson(
      this,
    );
  }
}

abstract class _Income implements Income {
  const factory _Income(
          {required final String id,
          required final double amount,
          required final String source,
          final String? description,
          @JsonKey(name: 'account_id') required final String accountId,
          required final DateTime date,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$IncomeImpl;

  factory _Income.fromJson(Map<String, dynamic> json) = _$IncomeImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get source;
  @override
  String? get description;
  @override

  /// ID akun yang menerima pemasukan ini — WAJIB (Phase 4)
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
  _$$IncomeImplCopyWith<_$IncomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetAllocation _$BudgetAllocationFromJson(Map<String, dynamic> json) {
  return _BudgetAllocation.fromJson(json);
}

/// @nodoc
mixin _$BudgetAllocation {
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetAllocationCopyWith<BudgetAllocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetAllocationCopyWith<$Res> {
  factory $BudgetAllocationCopyWith(
          BudgetAllocation value, $Res Function(BudgetAllocation) then) =
      _$BudgetAllocationCopyWithImpl<$Res, BudgetAllocation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      double percentage});
}

/// @nodoc
class _$BudgetAllocationCopyWithImpl<$Res, $Val extends BudgetAllocation>
    implements $BudgetAllocationCopyWith<$Res> {
  _$BudgetAllocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? allocatedAmount = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetAllocationImplCopyWith<$Res>
    implements $BudgetAllocationCopyWith<$Res> {
  factory _$$BudgetAllocationImplCopyWith(_$BudgetAllocationImpl value,
          $Res Function(_$BudgetAllocationImpl) then) =
      __$$BudgetAllocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      double percentage});
}

/// @nodoc
class __$$BudgetAllocationImplCopyWithImpl<$Res>
    extends _$BudgetAllocationCopyWithImpl<$Res, _$BudgetAllocationImpl>
    implements _$$BudgetAllocationImplCopyWith<$Res> {
  __$$BudgetAllocationImplCopyWithImpl(_$BudgetAllocationImpl _value,
      $Res Function(_$BudgetAllocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? allocatedAmount = null,
    Object? percentage = null,
  }) {
    return _then(_$BudgetAllocationImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetAllocationImpl implements _BudgetAllocation {
  const _$BudgetAllocationImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'allocated_amount') required this.allocatedAmount,
      required this.percentage});

  factory _$BudgetAllocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetAllocationImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'allocated_amount')
  final double allocatedAmount;
  @override
  final double percentage;

  @override
  String toString() {
    return 'BudgetAllocation(categoryId: $categoryId, categoryName: $categoryName, allocatedAmount: $allocatedAmount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetAllocationImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryName, allocatedAmount, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetAllocationImplCopyWith<_$BudgetAllocationImpl> get copyWith =>
      __$$BudgetAllocationImplCopyWithImpl<_$BudgetAllocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetAllocationImplToJson(
      this,
    );
  }
}

abstract class _BudgetAllocation implements BudgetAllocation {
  const factory _BudgetAllocation(
      {@JsonKey(name: 'category_id') required final String categoryId,
      @JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'allocated_amount') required final double allocatedAmount,
      required final double percentage}) = _$BudgetAllocationImpl;

  factory _BudgetAllocation.fromJson(Map<String, dynamic> json) =
      _$BudgetAllocationImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$BudgetAllocationImplCopyWith<_$BudgetAllocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncomeCreateResult _$IncomeCreateResultFromJson(Map<String, dynamic> json) {
  return _IncomeCreateResult.fromJson(json);
}

/// @nodoc
mixin _$IncomeCreateResult {
  Income get income => throw _privateConstructorUsedError;
  List<BudgetAllocation> get allocations => throw _privateConstructorUsedError;
  @JsonKey(name: 'already_allocated_warning')
  String? get alreadyAllocatedWarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCreateResultCopyWith<IncomeCreateResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCreateResultCopyWith<$Res> {
  factory $IncomeCreateResultCopyWith(
          IncomeCreateResult value, $Res Function(IncomeCreateResult) then) =
      _$IncomeCreateResultCopyWithImpl<$Res, IncomeCreateResult>;
  @useResult
  $Res call(
      {Income income,
      List<BudgetAllocation> allocations,
      @JsonKey(name: 'already_allocated_warning')
      String? alreadyAllocatedWarning});

  $IncomeCopyWith<$Res> get income;
}

/// @nodoc
class _$IncomeCreateResultCopyWithImpl<$Res, $Val extends IncomeCreateResult>
    implements $IncomeCreateResultCopyWith<$Res> {
  _$IncomeCreateResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? allocations = null,
    Object? alreadyAllocatedWarning = freezed,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Income,
      allocations: null == allocations
          ? _value.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<BudgetAllocation>,
      alreadyAllocatedWarning: freezed == alreadyAllocatedWarning
          ? _value.alreadyAllocatedWarning
          : alreadyAllocatedWarning // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IncomeCopyWith<$Res> get income {
    return $IncomeCopyWith<$Res>(_value.income, (value) {
      return _then(_value.copyWith(income: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IncomeCreateResultImplCopyWith<$Res>
    implements $IncomeCreateResultCopyWith<$Res> {
  factory _$$IncomeCreateResultImplCopyWith(_$IncomeCreateResultImpl value,
          $Res Function(_$IncomeCreateResultImpl) then) =
      __$$IncomeCreateResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Income income,
      List<BudgetAllocation> allocations,
      @JsonKey(name: 'already_allocated_warning')
      String? alreadyAllocatedWarning});

  @override
  $IncomeCopyWith<$Res> get income;
}

/// @nodoc
class __$$IncomeCreateResultImplCopyWithImpl<$Res>
    extends _$IncomeCreateResultCopyWithImpl<$Res, _$IncomeCreateResultImpl>
    implements _$$IncomeCreateResultImplCopyWith<$Res> {
  __$$IncomeCreateResultImplCopyWithImpl(_$IncomeCreateResultImpl _value,
      $Res Function(_$IncomeCreateResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? allocations = null,
    Object? alreadyAllocatedWarning = freezed,
  }) {
    return _then(_$IncomeCreateResultImpl(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Income,
      allocations: null == allocations
          ? _value._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<BudgetAllocation>,
      alreadyAllocatedWarning: freezed == alreadyAllocatedWarning
          ? _value.alreadyAllocatedWarning
          : alreadyAllocatedWarning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeCreateResultImpl implements _IncomeCreateResult {
  const _$IncomeCreateResultImpl(
      {required this.income,
      final List<BudgetAllocation> allocations = const [],
      @JsonKey(name: 'already_allocated_warning') this.alreadyAllocatedWarning})
      : _allocations = allocations;

  factory _$IncomeCreateResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeCreateResultImplFromJson(json);

  @override
  final Income income;
  final List<BudgetAllocation> _allocations;
  @override
  @JsonKey()
  List<BudgetAllocation> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  @override
  @JsonKey(name: 'already_allocated_warning')
  final String? alreadyAllocatedWarning;

  @override
  String toString() {
    return 'IncomeCreateResult(income: $income, allocations: $allocations, alreadyAllocatedWarning: $alreadyAllocatedWarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeCreateResultImpl &&
            (identical(other.income, income) || other.income == income) &&
            const DeepCollectionEquality()
                .equals(other._allocations, _allocations) &&
            (identical(
                    other.alreadyAllocatedWarning, alreadyAllocatedWarning) ||
                other.alreadyAllocatedWarning == alreadyAllocatedWarning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      income,
      const DeepCollectionEquality().hash(_allocations),
      alreadyAllocatedWarning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeCreateResultImplCopyWith<_$IncomeCreateResultImpl> get copyWith =>
      __$$IncomeCreateResultImplCopyWithImpl<_$IncomeCreateResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeCreateResultImplToJson(
      this,
    );
  }
}

abstract class _IncomeCreateResult implements IncomeCreateResult {
  const factory _IncomeCreateResult(
      {required final Income income,
      final List<BudgetAllocation> allocations,
      @JsonKey(name: 'already_allocated_warning')
      final String? alreadyAllocatedWarning}) = _$IncomeCreateResultImpl;

  factory _IncomeCreateResult.fromJson(Map<String, dynamic> json) =
      _$IncomeCreateResultImpl.fromJson;

  @override
  Income get income;
  @override
  List<BudgetAllocation> get allocations;
  @override
  @JsonKey(name: 'already_allocated_warning')
  String? get alreadyAllocatedWarning;
  @override
  @JsonKey(ignore: true)
  _$$IncomeCreateResultImplCopyWith<_$IncomeCreateResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
