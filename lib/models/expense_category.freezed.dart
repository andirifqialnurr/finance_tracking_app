// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) {
  return _ExpenseCategory.fromJson(json);
}

/// @nodoc
mixin _$ExpenseCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CategoryType get type => throw _privateConstructorUsedError;

  /// Budget bulanan. Untuk DAILY_CONTINUOUS ini auto-computed = dailyAmount * days.
  /// Default 0 agar dapat di-parse dari response /transactions yang tidak menyertakan field ini.
  @JsonKey(name: 'monthly_budget')
  double get monthlyBudget => throw _privateConstructorUsedError;

  /// HANYA untuk DAILY_CONTINUOUS: nominal harian (misal Rp 40.000/hari)
  @JsonKey(name: 'daily_amount')
  double? get dailyAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'allocation_priority')
  int get allocationPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Nullable agar kompatibel dengan embedded category di response /transactions
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseCategoryCopyWith<ExpenseCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseCategoryCopyWith<$Res> {
  factory $ExpenseCategoryCopyWith(
          ExpenseCategory value, $Res Function(ExpenseCategory) then) =
      _$ExpenseCategoryCopyWithImpl<$Res, ExpenseCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      CategoryType type,
      @JsonKey(name: 'monthly_budget') double monthlyBudget,
      @JsonKey(name: 'daily_amount') double? dailyAmount,
      @JsonKey(name: 'allocation_priority') int allocationPriority,
      @JsonKey(name: 'is_active') bool isActive,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$ExpenseCategoryCopyWithImpl<$Res, $Val extends ExpenseCategory>
    implements $ExpenseCategoryCopyWith<$Res> {
  _$ExpenseCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? monthlyBudget = null,
    Object? dailyAmount = freezed,
    Object? allocationPriority = null,
    Object? isActive = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      dailyAmount: freezed == dailyAmount
          ? _value.dailyAmount
          : dailyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      allocationPriority: null == allocationPriority
          ? _value.allocationPriority
          : allocationPriority // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
abstract class _$$ExpenseCategoryImplCopyWith<$Res>
    implements $ExpenseCategoryCopyWith<$Res> {
  factory _$$ExpenseCategoryImplCopyWith(_$ExpenseCategoryImpl value,
          $Res Function(_$ExpenseCategoryImpl) then) =
      __$$ExpenseCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      CategoryType type,
      @JsonKey(name: 'monthly_budget') double monthlyBudget,
      @JsonKey(name: 'daily_amount') double? dailyAmount,
      @JsonKey(name: 'allocation_priority') int allocationPriority,
      @JsonKey(name: 'is_active') bool isActive,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$ExpenseCategoryImplCopyWithImpl<$Res>
    extends _$ExpenseCategoryCopyWithImpl<$Res, _$ExpenseCategoryImpl>
    implements _$$ExpenseCategoryImplCopyWith<$Res> {
  __$$ExpenseCategoryImplCopyWithImpl(
      _$ExpenseCategoryImpl _value, $Res Function(_$ExpenseCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? monthlyBudget = null,
    Object? dailyAmount = freezed,
    Object? allocationPriority = null,
    Object? isActive = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ExpenseCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      dailyAmount: freezed == dailyAmount
          ? _value.dailyAmount
          : dailyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      allocationPriority: null == allocationPriority
          ? _value.allocationPriority
          : allocationPriority // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$ExpenseCategoryImpl implements _ExpenseCategory {
  const _$ExpenseCategoryImpl(
      {required this.id,
      required this.name,
      required this.type,
      @JsonKey(name: 'monthly_budget') this.monthlyBudget = 0.0,
      @JsonKey(name: 'daily_amount') this.dailyAmount,
      @JsonKey(name: 'allocation_priority') this.allocationPriority = 1,
      @JsonKey(name: 'is_active') this.isActive = true,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _metadata = metadata;

  factory _$ExpenseCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final CategoryType type;

  /// Budget bulanan. Untuk DAILY_CONTINUOUS ini auto-computed = dailyAmount * days.
  /// Default 0 agar dapat di-parse dari response /transactions yang tidak menyertakan field ini.
  @override
  @JsonKey(name: 'monthly_budget')
  final double monthlyBudget;

  /// HANYA untuk DAILY_CONTINUOUS: nominal harian (misal Rp 40.000/hari)
  @override
  @JsonKey(name: 'daily_amount')
  final double? dailyAmount;
  @override
  @JsonKey(name: 'allocation_priority')
  final int allocationPriority;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Nullable agar kompatibel dengan embedded category di response /transactions
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ExpenseCategory(id: $id, name: $name, type: $type, monthlyBudget: $monthlyBudget, dailyAmount: $dailyAmount, allocationPriority: $allocationPriority, isActive: $isActive, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.monthlyBudget, monthlyBudget) ||
                other.monthlyBudget == monthlyBudget) &&
            (identical(other.dailyAmount, dailyAmount) ||
                other.dailyAmount == dailyAmount) &&
            (identical(other.allocationPriority, allocationPriority) ||
                other.allocationPriority == allocationPriority) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
      name,
      type,
      monthlyBudget,
      dailyAmount,
      allocationPriority,
      isActive,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseCategoryImplCopyWith<_$ExpenseCategoryImpl> get copyWith =>
      __$$ExpenseCategoryImplCopyWithImpl<_$ExpenseCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseCategoryImplToJson(
      this,
    );
  }
}

abstract class _ExpenseCategory implements ExpenseCategory {
  const factory _ExpenseCategory(
          {required final String id,
          required final String name,
          required final CategoryType type,
          @JsonKey(name: 'monthly_budget') final double monthlyBudget,
          @JsonKey(name: 'daily_amount') final double? dailyAmount,
          @JsonKey(name: 'allocation_priority') final int allocationPriority,
          @JsonKey(name: 'is_active') final bool isActive,
          final Map<String, dynamic>? metadata,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$ExpenseCategoryImpl;

  factory _ExpenseCategory.fromJson(Map<String, dynamic> json) =
      _$ExpenseCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  CategoryType get type;
  @override

  /// Budget bulanan. Untuk DAILY_CONTINUOUS ini auto-computed = dailyAmount * days.
  /// Default 0 agar dapat di-parse dari response /transactions yang tidak menyertakan field ini.
  @JsonKey(name: 'monthly_budget')
  double get monthlyBudget;
  @override

  /// HANYA untuk DAILY_CONTINUOUS: nominal harian (misal Rp 40.000/hari)
  @JsonKey(name: 'daily_amount')
  double? get dailyAmount;
  @override
  @JsonKey(name: 'allocation_priority')
  int get allocationPriority;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  Map<String, dynamic>? get metadata;
  @override

  /// Nullable agar kompatibel dengan embedded category di response /transactions
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseCategoryImplCopyWith<_$ExpenseCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryBudget _$CategoryBudgetFromJson(Map<String, dynamic> json) {
  return _CategoryBudget.fromJson(json);
}

/// @nodoc
mixin _$CategoryBudget {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'spent_amount')
  double get spentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount')
  double get remainingAmount => throw _privateConstructorUsedError;

  /// Snapshot daily_amount saat alokasi (DAILY_CONTINUOUS)
  @JsonKey(name: 'effective_daily_amount')
  double? get effectiveDailyAmount => throw _privateConstructorUsedError;

  /// Snapshot jumlah hari bulan saat alokasi (DAILY_CONTINUOUS)
  @JsonKey(name: 'days_in_month')
  int? get daysInMonth => throw _privateConstructorUsedError;
  ExpenseCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryBudgetCopyWith<CategoryBudget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBudgetCopyWith<$Res> {
  factory $CategoryBudgetCopyWith(
          CategoryBudget value, $Res Function(CategoryBudget) then) =
      _$CategoryBudgetCopyWithImpl<$Res, CategoryBudget>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      int month,
      int year,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      @JsonKey(name: 'spent_amount') double spentAmount,
      @JsonKey(name: 'remaining_amount') double remainingAmount,
      @JsonKey(name: 'effective_daily_amount') double? effectiveDailyAmount,
      @JsonKey(name: 'days_in_month') int? daysInMonth,
      ExpenseCategory? category,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ExpenseCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$CategoryBudgetCopyWithImpl<$Res, $Val extends CategoryBudget>
    implements $CategoryBudgetCopyWith<$Res> {
  _$CategoryBudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? month = null,
    Object? year = null,
    Object? allocatedAmount = null,
    Object? spentAmount = null,
    Object? remainingAmount = null,
    Object? effectiveDailyAmount = freezed,
    Object? daysInMonth = freezed,
    Object? category = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      effectiveDailyAmount: freezed == effectiveDailyAmount
          ? _value.effectiveDailyAmount
          : effectiveDailyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      daysInMonth: freezed == daysInMonth
          ? _value.daysInMonth
          : daysInMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
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

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ExpenseCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryBudgetImplCopyWith<$Res>
    implements $CategoryBudgetCopyWith<$Res> {
  factory _$$CategoryBudgetImplCopyWith(_$CategoryBudgetImpl value,
          $Res Function(_$CategoryBudgetImpl) then) =
      __$$CategoryBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      int month,
      int year,
      @JsonKey(name: 'allocated_amount') double allocatedAmount,
      @JsonKey(name: 'spent_amount') double spentAmount,
      @JsonKey(name: 'remaining_amount') double remainingAmount,
      @JsonKey(name: 'effective_daily_amount') double? effectiveDailyAmount,
      @JsonKey(name: 'days_in_month') int? daysInMonth,
      ExpenseCategory? category,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ExpenseCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$CategoryBudgetImplCopyWithImpl<$Res>
    extends _$CategoryBudgetCopyWithImpl<$Res, _$CategoryBudgetImpl>
    implements _$$CategoryBudgetImplCopyWith<$Res> {
  __$$CategoryBudgetImplCopyWithImpl(
      _$CategoryBudgetImpl _value, $Res Function(_$CategoryBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? month = null,
    Object? year = null,
    Object? allocatedAmount = null,
    Object? spentAmount = null,
    Object? remainingAmount = null,
    Object? effectiveDailyAmount = freezed,
    Object? daysInMonth = freezed,
    Object? category = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CategoryBudgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      allocatedAmount: null == allocatedAmount
          ? _value.allocatedAmount
          : allocatedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      effectiveDailyAmount: freezed == effectiveDailyAmount
          ? _value.effectiveDailyAmount
          : effectiveDailyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      daysInMonth: freezed == daysInMonth
          ? _value.daysInMonth
          : daysInMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
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
class _$CategoryBudgetImpl implements _CategoryBudget {
  const _$CategoryBudgetImpl(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.month,
      required this.year,
      @JsonKey(name: 'allocated_amount') this.allocatedAmount = 0,
      @JsonKey(name: 'spent_amount') this.spentAmount = 0,
      @JsonKey(name: 'remaining_amount') this.remainingAmount = 0,
      @JsonKey(name: 'effective_daily_amount') this.effectiveDailyAmount,
      @JsonKey(name: 'days_in_month') this.daysInMonth,
      this.category,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$CategoryBudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBudgetImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'allocated_amount')
  final double allocatedAmount;
  @override
  @JsonKey(name: 'spent_amount')
  final double spentAmount;
  @override
  @JsonKey(name: 'remaining_amount')
  final double remainingAmount;

  /// Snapshot daily_amount saat alokasi (DAILY_CONTINUOUS)
  @override
  @JsonKey(name: 'effective_daily_amount')
  final double? effectiveDailyAmount;

  /// Snapshot jumlah hari bulan saat alokasi (DAILY_CONTINUOUS)
  @override
  @JsonKey(name: 'days_in_month')
  final int? daysInMonth;
  @override
  final ExpenseCategory? category;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CategoryBudget(id: $id, categoryId: $categoryId, month: $month, year: $year, allocatedAmount: $allocatedAmount, spentAmount: $spentAmount, remainingAmount: $remainingAmount, effectiveDailyAmount: $effectiveDailyAmount, daysInMonth: $daysInMonth, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBudgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.allocatedAmount, allocatedAmount) ||
                other.allocatedAmount == allocatedAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.effectiveDailyAmount, effectiveDailyAmount) ||
                other.effectiveDailyAmount == effectiveDailyAmount) &&
            (identical(other.daysInMonth, daysInMonth) ||
                other.daysInMonth == daysInMonth) &&
            (identical(other.category, category) ||
                other.category == category) &&
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
      categoryId,
      month,
      year,
      allocatedAmount,
      spentAmount,
      remainingAmount,
      effectiveDailyAmount,
      daysInMonth,
      category,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBudgetImplCopyWith<_$CategoryBudgetImpl> get copyWith =>
      __$$CategoryBudgetImplCopyWithImpl<_$CategoryBudgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBudgetImplToJson(
      this,
    );
  }
}

abstract class _CategoryBudget implements CategoryBudget {
  const factory _CategoryBudget(
          {required final String id,
          @JsonKey(name: 'category_id') required final String categoryId,
          required final int month,
          required final int year,
          @JsonKey(name: 'allocated_amount') final double allocatedAmount,
          @JsonKey(name: 'spent_amount') final double spentAmount,
          @JsonKey(name: 'remaining_amount') final double remainingAmount,
          @JsonKey(name: 'effective_daily_amount')
          final double? effectiveDailyAmount,
          @JsonKey(name: 'days_in_month') final int? daysInMonth,
          final ExpenseCategory? category,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$CategoryBudgetImpl;

  factory _CategoryBudget.fromJson(Map<String, dynamic> json) =
      _$CategoryBudgetImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'allocated_amount')
  double get allocatedAmount;
  @override
  @JsonKey(name: 'spent_amount')
  double get spentAmount;
  @override
  @JsonKey(name: 'remaining_amount')
  double get remainingAmount;
  @override

  /// Snapshot daily_amount saat alokasi (DAILY_CONTINUOUS)
  @JsonKey(name: 'effective_daily_amount')
  double? get effectiveDailyAmount;
  @override

  /// Snapshot jumlah hari bulan saat alokasi (DAILY_CONTINUOUS)
  @JsonKey(name: 'days_in_month')
  int? get daysInMonth;
  @override
  ExpenseCategory? get category;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CategoryBudgetImplCopyWith<_$CategoryBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
