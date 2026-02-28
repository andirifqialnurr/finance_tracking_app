// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetSummary _$BudgetSummaryFromJson(Map<String, dynamic> json) {
  return _BudgetSummary.fromJson(json);
}

/// @nodoc
mixin _$BudgetSummary {
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_allocated')
  double get totalAllocated => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_remaining')
  double get totalRemaining => throw _privateConstructorUsedError;
  double get unallocated => throw _privateConstructorUsedError;
  double get savings => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_over_budget')
  int get categoriesOverBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'categories_warning')
  int get categoriesWarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetSummaryCopyWith<BudgetSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetSummaryCopyWith<$Res> {
  factory $BudgetSummaryCopyWith(
          BudgetSummary value, $Res Function(BudgetSummary) then) =
      _$BudgetSummaryCopyWithImpl<$Res, BudgetSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_allocated') double totalAllocated,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_remaining') double totalRemaining,
      double unallocated,
      double savings,
      @JsonKey(name: 'categories_over_budget') int categoriesOverBudget,
      @JsonKey(name: 'categories_warning') int categoriesWarning});
}

/// @nodoc
class _$BudgetSummaryCopyWithImpl<$Res, $Val extends BudgetSummary>
    implements $BudgetSummaryCopyWith<$Res> {
  _$BudgetSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalAllocated = null,
    Object? totalSpent = null,
    Object? totalRemaining = null,
    Object? unallocated = null,
    Object? savings = null,
    Object? categoriesOverBudget = null,
    Object? categoriesWarning = null,
  }) {
    return _then(_value.copyWith(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalAllocated: null == totalAllocated
          ? _value.totalAllocated
          : totalAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalRemaining: null == totalRemaining
          ? _value.totalRemaining
          : totalRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      unallocated: null == unallocated
          ? _value.unallocated
          : unallocated // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
      categoriesOverBudget: null == categoriesOverBudget
          ? _value.categoriesOverBudget
          : categoriesOverBudget // ignore: cast_nullable_to_non_nullable
              as int,
      categoriesWarning: null == categoriesWarning
          ? _value.categoriesWarning
          : categoriesWarning // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetSummaryImplCopyWith<$Res>
    implements $BudgetSummaryCopyWith<$Res> {
  factory _$$BudgetSummaryImplCopyWith(
          _$BudgetSummaryImpl value, $Res Function(_$BudgetSummaryImpl) then) =
      __$$BudgetSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_allocated') double totalAllocated,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_remaining') double totalRemaining,
      double unallocated,
      double savings,
      @JsonKey(name: 'categories_over_budget') int categoriesOverBudget,
      @JsonKey(name: 'categories_warning') int categoriesWarning});
}

/// @nodoc
class __$$BudgetSummaryImplCopyWithImpl<$Res>
    extends _$BudgetSummaryCopyWithImpl<$Res, _$BudgetSummaryImpl>
    implements _$$BudgetSummaryImplCopyWith<$Res> {
  __$$BudgetSummaryImplCopyWithImpl(
      _$BudgetSummaryImpl _value, $Res Function(_$BudgetSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalIncome = null,
    Object? totalAllocated = null,
    Object? totalSpent = null,
    Object? totalRemaining = null,
    Object? unallocated = null,
    Object? savings = null,
    Object? categoriesOverBudget = null,
    Object? categoriesWarning = null,
  }) {
    return _then(_$BudgetSummaryImpl(
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalAllocated: null == totalAllocated
          ? _value.totalAllocated
          : totalAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalRemaining: null == totalRemaining
          ? _value.totalRemaining
          : totalRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      unallocated: null == unallocated
          ? _value.unallocated
          : unallocated // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
      categoriesOverBudget: null == categoriesOverBudget
          ? _value.categoriesOverBudget
          : categoriesOverBudget // ignore: cast_nullable_to_non_nullable
              as int,
      categoriesWarning: null == categoriesWarning
          ? _value.categoriesWarning
          : categoriesWarning // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetSummaryImpl implements _BudgetSummary {
  const _$BudgetSummaryImpl(
      {@JsonKey(name: 'total_income') this.totalIncome = 0,
      @JsonKey(name: 'total_allocated') this.totalAllocated = 0,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'total_remaining') this.totalRemaining = 0,
      this.unallocated = 0,
      this.savings = 0,
      @JsonKey(name: 'categories_over_budget') this.categoriesOverBudget = 0,
      @JsonKey(name: 'categories_warning') this.categoriesWarning = 0});

  factory _$BudgetSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'total_allocated')
  final double totalAllocated;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'total_remaining')
  final double totalRemaining;
  @override
  @JsonKey()
  final double unallocated;
  @override
  @JsonKey()
  final double savings;
  @override
  @JsonKey(name: 'categories_over_budget')
  final int categoriesOverBudget;
  @override
  @JsonKey(name: 'categories_warning')
  final int categoriesWarning;

  @override
  String toString() {
    return 'BudgetSummary(totalIncome: $totalIncome, totalAllocated: $totalAllocated, totalSpent: $totalSpent, totalRemaining: $totalRemaining, unallocated: $unallocated, savings: $savings, categoriesOverBudget: $categoriesOverBudget, categoriesWarning: $categoriesWarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetSummaryImpl &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalAllocated, totalAllocated) ||
                other.totalAllocated == totalAllocated) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalRemaining, totalRemaining) ||
                other.totalRemaining == totalRemaining) &&
            (identical(other.unallocated, unallocated) ||
                other.unallocated == unallocated) &&
            (identical(other.savings, savings) || other.savings == savings) &&
            (identical(other.categoriesOverBudget, categoriesOverBudget) ||
                other.categoriesOverBudget == categoriesOverBudget) &&
            (identical(other.categoriesWarning, categoriesWarning) ||
                other.categoriesWarning == categoriesWarning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalIncome,
      totalAllocated,
      totalSpent,
      totalRemaining,
      unallocated,
      savings,
      categoriesOverBudget,
      categoriesWarning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetSummaryImplCopyWith<_$BudgetSummaryImpl> get copyWith =>
      __$$BudgetSummaryImplCopyWithImpl<_$BudgetSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetSummaryImplToJson(
      this,
    );
  }
}

abstract class _BudgetSummary implements BudgetSummary {
  const factory _BudgetSummary(
      {@JsonKey(name: 'total_income') final double totalIncome,
      @JsonKey(name: 'total_allocated') final double totalAllocated,
      @JsonKey(name: 'total_spent') final double totalSpent,
      @JsonKey(name: 'total_remaining') final double totalRemaining,
      final double unallocated,
      final double savings,
      @JsonKey(name: 'categories_over_budget') final int categoriesOverBudget,
      @JsonKey(name: 'categories_warning')
      final int categoriesWarning}) = _$BudgetSummaryImpl;

  factory _BudgetSummary.fromJson(Map<String, dynamic> json) =
      _$BudgetSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'total_allocated')
  double get totalAllocated;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'total_remaining')
  double get totalRemaining;
  @override
  double get unallocated;
  @override
  double get savings;
  @override
  @JsonKey(name: 'categories_over_budget')
  int get categoriesOverBudget;
  @override
  @JsonKey(name: 'categories_warning')
  int get categoriesWarning;
  @override
  @JsonKey(ignore: true)
  _$$BudgetSummaryImplCopyWith<_$BudgetSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetWithCategory _$BudgetWithCategoryFromJson(Map<String, dynamic> json) {
  return _BudgetWithCategory.fromJson(json);
}

/// @nodoc
mixin _$BudgetWithCategory {
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
  @JsonKey(name: 'effective_daily_amount')
  double? get effectiveDailyAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_in_month')
  int? get daysInMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_used')
  double get percentageUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'alert_status')
  String get alertStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'alert_threshold')
  int get alertThreshold => throw _privateConstructorUsedError;
  ExpenseCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetWithCategoryCopyWith<BudgetWithCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetWithCategoryCopyWith<$Res> {
  factory $BudgetWithCategoryCopyWith(
          BudgetWithCategory value, $Res Function(BudgetWithCategory) then) =
      _$BudgetWithCategoryCopyWithImpl<$Res, BudgetWithCategory>;
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
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'alert_status') String alertStatus,
      @JsonKey(name: 'alert_threshold') int alertThreshold,
      ExpenseCategory? category,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  $ExpenseCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$BudgetWithCategoryCopyWithImpl<$Res, $Val extends BudgetWithCategory>
    implements $BudgetWithCategoryCopyWith<$Res> {
  _$BudgetWithCategoryCopyWithImpl(this._value, this._then);

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
    Object? percentageUsed = null,
    Object? alertStatus = null,
    Object? alertThreshold = null,
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
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      alertStatus: null == alertStatus
          ? _value.alertStatus
          : alertStatus // ignore: cast_nullable_to_non_nullable
              as String,
      alertThreshold: null == alertThreshold
          ? _value.alertThreshold
          : alertThreshold // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$BudgetWithCategoryImplCopyWith<$Res>
    implements $BudgetWithCategoryCopyWith<$Res> {
  factory _$$BudgetWithCategoryImplCopyWith(_$BudgetWithCategoryImpl value,
          $Res Function(_$BudgetWithCategoryImpl) then) =
      __$$BudgetWithCategoryImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'alert_status') String alertStatus,
      @JsonKey(name: 'alert_threshold') int alertThreshold,
      ExpenseCategory? category,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});

  @override
  $ExpenseCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$BudgetWithCategoryImplCopyWithImpl<$Res>
    extends _$BudgetWithCategoryCopyWithImpl<$Res, _$BudgetWithCategoryImpl>
    implements _$$BudgetWithCategoryImplCopyWith<$Res> {
  __$$BudgetWithCategoryImplCopyWithImpl(_$BudgetWithCategoryImpl _value,
      $Res Function(_$BudgetWithCategoryImpl) _then)
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
    Object? percentageUsed = null,
    Object? alertStatus = null,
    Object? alertThreshold = null,
    Object? category = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BudgetWithCategoryImpl(
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
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      alertStatus: null == alertStatus
          ? _value.alertStatus
          : alertStatus // ignore: cast_nullable_to_non_nullable
              as String,
      alertThreshold: null == alertThreshold
          ? _value.alertThreshold
          : alertThreshold // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$BudgetWithCategoryImpl implements _BudgetWithCategory {
  const _$BudgetWithCategoryImpl(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.month,
      required this.year,
      @JsonKey(name: 'allocated_amount') this.allocatedAmount = 0,
      @JsonKey(name: 'spent_amount') this.spentAmount = 0,
      @JsonKey(name: 'remaining_amount') this.remainingAmount = 0,
      @JsonKey(name: 'effective_daily_amount') this.effectiveDailyAmount,
      @JsonKey(name: 'days_in_month') this.daysInMonth,
      @JsonKey(name: 'percentage_used') this.percentageUsed = 0,
      @JsonKey(name: 'alert_status') this.alertStatus = 'safe',
      @JsonKey(name: 'alert_threshold') this.alertThreshold = 80,
      this.category,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$BudgetWithCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetWithCategoryImplFromJson(json);

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
  @override
  @JsonKey(name: 'effective_daily_amount')
  final double? effectiveDailyAmount;
  @override
  @JsonKey(name: 'days_in_month')
  final int? daysInMonth;
  @override
  @JsonKey(name: 'percentage_used')
  final double percentageUsed;
  @override
  @JsonKey(name: 'alert_status')
  final String alertStatus;
  @override
  @JsonKey(name: 'alert_threshold')
  final int alertThreshold;
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
    return 'BudgetWithCategory(id: $id, categoryId: $categoryId, month: $month, year: $year, allocatedAmount: $allocatedAmount, spentAmount: $spentAmount, remainingAmount: $remainingAmount, effectiveDailyAmount: $effectiveDailyAmount, daysInMonth: $daysInMonth, percentageUsed: $percentageUsed, alertStatus: $alertStatus, alertThreshold: $alertThreshold, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetWithCategoryImpl &&
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
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.alertStatus, alertStatus) ||
                other.alertStatus == alertStatus) &&
            (identical(other.alertThreshold, alertThreshold) ||
                other.alertThreshold == alertThreshold) &&
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
      percentageUsed,
      alertStatus,
      alertThreshold,
      category,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetWithCategoryImplCopyWith<_$BudgetWithCategoryImpl> get copyWith =>
      __$$BudgetWithCategoryImplCopyWithImpl<_$BudgetWithCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetWithCategoryImplToJson(
      this,
    );
  }
}

abstract class _BudgetWithCategory implements BudgetWithCategory {
  const factory _BudgetWithCategory(
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
          @JsonKey(name: 'percentage_used') final double percentageUsed,
          @JsonKey(name: 'alert_status') final String alertStatus,
          @JsonKey(name: 'alert_threshold') final int alertThreshold,
          final ExpenseCategory? category,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$BudgetWithCategoryImpl;

  factory _BudgetWithCategory.fromJson(Map<String, dynamic> json) =
      _$BudgetWithCategoryImpl.fromJson;

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
  @JsonKey(name: 'effective_daily_amount')
  double? get effectiveDailyAmount;
  @override
  @JsonKey(name: 'days_in_month')
  int? get daysInMonth;
  @override
  @JsonKey(name: 'percentage_used')
  double get percentageUsed;
  @override
  @JsonKey(name: 'alert_status')
  String get alertStatus;
  @override
  @JsonKey(name: 'alert_threshold')
  int get alertThreshold;
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
  _$$BudgetWithCategoryImplCopyWith<_$BudgetWithCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetReallocation _$BudgetReallocationFromJson(Map<String, dynamic> json) {
  return _BudgetReallocation.fromJson(json);
}

/// @nodoc
mixin _$BudgetReallocation {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_category_id')
  String get fromCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_category_id')
  String get toCategoryId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_category')
  ExpenseCategory? get fromCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_category')
  ExpenseCategory? get toCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetReallocationCopyWith<BudgetReallocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetReallocationCopyWith<$Res> {
  factory $BudgetReallocationCopyWith(
          BudgetReallocation value, $Res Function(BudgetReallocation) then) =
      _$BudgetReallocationCopyWithImpl<$Res, BudgetReallocation>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'from_category_id') String fromCategoryId,
      @JsonKey(name: 'to_category_id') String toCategoryId,
      double amount,
      String? reason,
      int month,
      int year,
      @JsonKey(name: 'from_category') ExpenseCategory? fromCategory,
      @JsonKey(name: 'to_category') ExpenseCategory? toCategory,
      @JsonKey(name: 'created_at') DateTime createdAt});

  $ExpenseCategoryCopyWith<$Res>? get fromCategory;
  $ExpenseCategoryCopyWith<$Res>? get toCategory;
}

/// @nodoc
class _$BudgetReallocationCopyWithImpl<$Res, $Val extends BudgetReallocation>
    implements $BudgetReallocationCopyWith<$Res> {
  _$BudgetReallocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromCategoryId = null,
    Object? toCategoryId = null,
    Object? amount = null,
    Object? reason = freezed,
    Object? month = null,
    Object? year = null,
    Object? fromCategory = freezed,
    Object? toCategory = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromCategoryId: null == fromCategoryId
          ? _value.fromCategoryId
          : fromCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      toCategoryId: null == toCategoryId
          ? _value.toCategoryId
          : toCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      fromCategory: freezed == fromCategory
          ? _value.fromCategory
          : fromCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      toCategory: freezed == toCategory
          ? _value.toCategory
          : toCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res>? get fromCategory {
    if (_value.fromCategory == null) {
      return null;
    }

    return $ExpenseCategoryCopyWith<$Res>(_value.fromCategory!, (value) {
      return _then(_value.copyWith(fromCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpenseCategoryCopyWith<$Res>? get toCategory {
    if (_value.toCategory == null) {
      return null;
    }

    return $ExpenseCategoryCopyWith<$Res>(_value.toCategory!, (value) {
      return _then(_value.copyWith(toCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetReallocationImplCopyWith<$Res>
    implements $BudgetReallocationCopyWith<$Res> {
  factory _$$BudgetReallocationImplCopyWith(_$BudgetReallocationImpl value,
          $Res Function(_$BudgetReallocationImpl) then) =
      __$$BudgetReallocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'from_category_id') String fromCategoryId,
      @JsonKey(name: 'to_category_id') String toCategoryId,
      double amount,
      String? reason,
      int month,
      int year,
      @JsonKey(name: 'from_category') ExpenseCategory? fromCategory,
      @JsonKey(name: 'to_category') ExpenseCategory? toCategory,
      @JsonKey(name: 'created_at') DateTime createdAt});

  @override
  $ExpenseCategoryCopyWith<$Res>? get fromCategory;
  @override
  $ExpenseCategoryCopyWith<$Res>? get toCategory;
}

/// @nodoc
class __$$BudgetReallocationImplCopyWithImpl<$Res>
    extends _$BudgetReallocationCopyWithImpl<$Res, _$BudgetReallocationImpl>
    implements _$$BudgetReallocationImplCopyWith<$Res> {
  __$$BudgetReallocationImplCopyWithImpl(_$BudgetReallocationImpl _value,
      $Res Function(_$BudgetReallocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromCategoryId = null,
    Object? toCategoryId = null,
    Object? amount = null,
    Object? reason = freezed,
    Object? month = null,
    Object? year = null,
    Object? fromCategory = freezed,
    Object? toCategory = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$BudgetReallocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromCategoryId: null == fromCategoryId
          ? _value.fromCategoryId
          : fromCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      toCategoryId: null == toCategoryId
          ? _value.toCategoryId
          : toCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      fromCategory: freezed == fromCategory
          ? _value.fromCategory
          : fromCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      toCategory: freezed == toCategory
          ? _value.toCategory
          : toCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetReallocationImpl implements _BudgetReallocation {
  const _$BudgetReallocationImpl(
      {required this.id,
      @JsonKey(name: 'from_category_id') required this.fromCategoryId,
      @JsonKey(name: 'to_category_id') required this.toCategoryId,
      required this.amount,
      this.reason,
      required this.month,
      required this.year,
      @JsonKey(name: 'from_category') this.fromCategory,
      @JsonKey(name: 'to_category') this.toCategory,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$BudgetReallocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetReallocationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'from_category_id')
  final String fromCategoryId;
  @override
  @JsonKey(name: 'to_category_id')
  final String toCategoryId;
  @override
  final double amount;
  @override
  final String? reason;
  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'from_category')
  final ExpenseCategory? fromCategory;
  @override
  @JsonKey(name: 'to_category')
  final ExpenseCategory? toCategory;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'BudgetReallocation(id: $id, fromCategoryId: $fromCategoryId, toCategoryId: $toCategoryId, amount: $amount, reason: $reason, month: $month, year: $year, fromCategory: $fromCategory, toCategory: $toCategory, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetReallocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fromCategoryId, fromCategoryId) ||
                other.fromCategoryId == fromCategoryId) &&
            (identical(other.toCategoryId, toCategoryId) ||
                other.toCategoryId == toCategoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.fromCategory, fromCategory) ||
                other.fromCategory == fromCategory) &&
            (identical(other.toCategory, toCategory) ||
                other.toCategory == toCategory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fromCategoryId, toCategoryId,
      amount, reason, month, year, fromCategory, toCategory, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetReallocationImplCopyWith<_$BudgetReallocationImpl> get copyWith =>
      __$$BudgetReallocationImplCopyWithImpl<_$BudgetReallocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetReallocationImplToJson(
      this,
    );
  }
}

abstract class _BudgetReallocation implements BudgetReallocation {
  const factory _BudgetReallocation(
      {required final String id,
      @JsonKey(name: 'from_category_id') required final String fromCategoryId,
      @JsonKey(name: 'to_category_id') required final String toCategoryId,
      required final double amount,
      final String? reason,
      required final int month,
      required final int year,
      @JsonKey(name: 'from_category') final ExpenseCategory? fromCategory,
      @JsonKey(name: 'to_category') final ExpenseCategory? toCategory,
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$BudgetReallocationImpl;

  factory _BudgetReallocation.fromJson(Map<String, dynamic> json) =
      _$BudgetReallocationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'from_category_id')
  String get fromCategoryId;
  @override
  @JsonKey(name: 'to_category_id')
  String get toCategoryId;
  @override
  double get amount;
  @override
  String? get reason;
  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'from_category')
  ExpenseCategory? get fromCategory;
  @override
  @JsonKey(name: 'to_category')
  ExpenseCategory? get toCategory;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BudgetReallocationImplCopyWith<_$BudgetReallocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
