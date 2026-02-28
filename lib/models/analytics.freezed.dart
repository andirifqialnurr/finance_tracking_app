// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailySpending _$DailySpendingFromJson(Map<String, dynamic> json) {
  return _DailySpending.fromJson(json);
}

/// @nodoc
mixin _$DailySpending {
  String get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_count')
  int get transactionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailySpendingCopyWith<DailySpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySpendingCopyWith<$Res> {
  factory $DailySpendingCopyWith(
          DailySpending value, $Res Function(DailySpending) then) =
      _$DailySpendingCopyWithImpl<$Res, DailySpending>;
  @useResult
  $Res call(
      {String date,
      double amount,
      @JsonKey(name: 'transaction_count') int transactionCount});
}

/// @nodoc
class _$DailySpendingCopyWithImpl<$Res, $Val extends DailySpending>
    implements $DailySpendingCopyWith<$Res> {
  _$DailySpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? transactionCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySpendingImplCopyWith<$Res>
    implements $DailySpendingCopyWith<$Res> {
  factory _$$DailySpendingImplCopyWith(
          _$DailySpendingImpl value, $Res Function(_$DailySpendingImpl) then) =
      __$$DailySpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      double amount,
      @JsonKey(name: 'transaction_count') int transactionCount});
}

/// @nodoc
class __$$DailySpendingImplCopyWithImpl<$Res>
    extends _$DailySpendingCopyWithImpl<$Res, _$DailySpendingImpl>
    implements _$$DailySpendingImplCopyWith<$Res> {
  __$$DailySpendingImplCopyWithImpl(
      _$DailySpendingImpl _value, $Res Function(_$DailySpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? transactionCount = null,
  }) {
    return _then(_$DailySpendingImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySpendingImpl implements _DailySpending {
  const _$DailySpendingImpl(
      {required this.date,
      required this.amount,
      @JsonKey(name: 'transaction_count') this.transactionCount = 0});

  factory _$DailySpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySpendingImplFromJson(json);

  @override
  final String date;
  @override
  final double amount;
  @override
  @JsonKey(name: 'transaction_count')
  final int transactionCount;

  @override
  String toString() {
    return 'DailySpending(date: $date, amount: $amount, transactionCount: $transactionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySpendingImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, amount, transactionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySpendingImplCopyWith<_$DailySpendingImpl> get copyWith =>
      __$$DailySpendingImplCopyWithImpl<_$DailySpendingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySpendingImplToJson(
      this,
    );
  }
}

abstract class _DailySpending implements DailySpending {
  const factory _DailySpending(
          {required final String date,
          required final double amount,
          @JsonKey(name: 'transaction_count') final int transactionCount}) =
      _$DailySpendingImpl;

  factory _DailySpending.fromJson(Map<String, dynamic> json) =
      _$DailySpendingImpl.fromJson;

  @override
  String get date;
  @override
  double get amount;
  @override
  @JsonKey(name: 'transaction_count')
  int get transactionCount;
  @override
  @JsonKey(ignore: true)
  _$$DailySpendingImplCopyWith<_$DailySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingPattern _$SpendingPatternFromJson(Map<String, dynamic> json) {
  return _SpendingPattern.fromJson(json);
}

/// @nodoc
mixin _$SpendingPattern {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_allocated')
  double get budgetAllocated => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_used')
  double get percentageUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_count')
  int get transactionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_breakdown')
  List<DailySpending> get dailyBreakdown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingPatternCopyWith<SpendingPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingPatternCopyWith<$Res> {
  factory $SpendingPatternCopyWith(
          SpendingPattern value, $Res Function(SpendingPattern) then) =
      _$SpendingPatternCopyWithImpl<$Res, SpendingPattern>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'budget_allocated') double budgetAllocated,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'transaction_count') int transactionCount,
      @JsonKey(name: 'daily_breakdown') List<DailySpending> dailyBreakdown});
}

/// @nodoc
class _$SpendingPatternCopyWithImpl<$Res, $Val extends SpendingPattern>
    implements $SpendingPatternCopyWith<$Res> {
  _$SpendingPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? totalSpent = null,
    Object? budgetAllocated = null,
    Object? percentageUsed = null,
    Object? transactionCount = null,
    Object? dailyBreakdown = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyBreakdown: null == dailyBreakdown
          ? _value.dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailySpending>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingPatternImplCopyWith<$Res>
    implements $SpendingPatternCopyWith<$Res> {
  factory _$$SpendingPatternImplCopyWith(_$SpendingPatternImpl value,
          $Res Function(_$SpendingPatternImpl) then) =
      __$$SpendingPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'category_id') String? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'budget_allocated') double budgetAllocated,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'transaction_count') int transactionCount,
      @JsonKey(name: 'daily_breakdown') List<DailySpending> dailyBreakdown});
}

/// @nodoc
class __$$SpendingPatternImplCopyWithImpl<$Res>
    extends _$SpendingPatternCopyWithImpl<$Res, _$SpendingPatternImpl>
    implements _$$SpendingPatternImplCopyWith<$Res> {
  __$$SpendingPatternImplCopyWithImpl(
      _$SpendingPatternImpl _value, $Res Function(_$SpendingPatternImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? totalSpent = null,
    Object? budgetAllocated = null,
    Object? percentageUsed = null,
    Object? transactionCount = null,
    Object? dailyBreakdown = null,
  }) {
    return _then(_$SpendingPatternImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyBreakdown: null == dailyBreakdown
          ? _value._dailyBreakdown
          : dailyBreakdown // ignore: cast_nullable_to_non_nullable
              as List<DailySpending>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingPatternImpl implements _SpendingPattern {
  const _$SpendingPatternImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'category_name') this.categoryName,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'budget_allocated') this.budgetAllocated = 0,
      @JsonKey(name: 'percentage_used') this.percentageUsed = 0,
      @JsonKey(name: 'transaction_count') this.transactionCount = 0,
      @JsonKey(name: 'daily_breakdown')
      final List<DailySpending> dailyBreakdown = const []})
      : _dailyBreakdown = dailyBreakdown;

  factory _$SpendingPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingPatternImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'budget_allocated')
  final double budgetAllocated;
  @override
  @JsonKey(name: 'percentage_used')
  final double percentageUsed;
  @override
  @JsonKey(name: 'transaction_count')
  final int transactionCount;
  final List<DailySpending> _dailyBreakdown;
  @override
  @JsonKey(name: 'daily_breakdown')
  List<DailySpending> get dailyBreakdown {
    if (_dailyBreakdown is EqualUnmodifiableListView) return _dailyBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyBreakdown);
  }

  @override
  String toString() {
    return 'SpendingPattern(month: $month, year: $year, categoryId: $categoryId, categoryName: $categoryName, totalSpent: $totalSpent, budgetAllocated: $budgetAllocated, percentageUsed: $percentageUsed, transactionCount: $transactionCount, dailyBreakdown: $dailyBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingPatternImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.budgetAllocated, budgetAllocated) ||
                other.budgetAllocated == budgetAllocated) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            const DeepCollectionEquality()
                .equals(other._dailyBreakdown, _dailyBreakdown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      month,
      year,
      categoryId,
      categoryName,
      totalSpent,
      budgetAllocated,
      percentageUsed,
      transactionCount,
      const DeepCollectionEquality().hash(_dailyBreakdown));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingPatternImplCopyWith<_$SpendingPatternImpl> get copyWith =>
      __$$SpendingPatternImplCopyWithImpl<_$SpendingPatternImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingPatternImplToJson(
      this,
    );
  }
}

abstract class _SpendingPattern implements SpendingPattern {
  const factory _SpendingPattern(
      {required final int month,
      required final int year,
      @JsonKey(name: 'category_id') final String? categoryId,
      @JsonKey(name: 'category_name') final String? categoryName,
      @JsonKey(name: 'total_spent') final double totalSpent,
      @JsonKey(name: 'budget_allocated') final double budgetAllocated,
      @JsonKey(name: 'percentage_used') final double percentageUsed,
      @JsonKey(name: 'transaction_count') final int transactionCount,
      @JsonKey(name: 'daily_breakdown')
      final List<DailySpending> dailyBreakdown}) = _$SpendingPatternImpl;

  factory _SpendingPattern.fromJson(Map<String, dynamic> json) =
      _$SpendingPatternImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'budget_allocated')
  double get budgetAllocated;
  @override
  @JsonKey(name: 'percentage_used')
  double get percentageUsed;
  @override
  @JsonKey(name: 'transaction_count')
  int get transactionCount;
  @override
  @JsonKey(name: 'daily_breakdown')
  List<DailySpending> get dailyBreakdown;
  @override
  @JsonKey(ignore: true)
  _$$SpendingPatternImplCopyWith<_$SpendingPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryComparison _$CategoryComparisonFromJson(Map<String, dynamic> json) {
  return _CategoryComparison.fromJson(json);
}

/// @nodoc
mixin _$CategoryComparison {
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_amount')
  double get budgetAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_used')
  double get percentageUsed => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryComparisonCopyWith<CategoryComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryComparisonCopyWith<$Res> {
  factory $CategoryComparisonCopyWith(
          CategoryComparison value, $Res Function(CategoryComparison) then) =
      _$CategoryComparisonCopyWithImpl<$Res, CategoryComparison>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      int month,
      int year,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      String? color});
}

/// @nodoc
class _$CategoryComparisonCopyWithImpl<$Res, $Val extends CategoryComparison>
    implements $CategoryComparisonCopyWith<$Res> {
  _$CategoryComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? budgetAmount = null,
    Object? percentageUsed = null,
    Object? color = freezed,
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
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryComparisonImplCopyWith<$Res>
    implements $CategoryComparisonCopyWith<$Res> {
  factory _$$CategoryComparisonImplCopyWith(_$CategoryComparisonImpl value,
          $Res Function(_$CategoryComparisonImpl) then) =
      __$$CategoryComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      int month,
      int year,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      String? color});
}

/// @nodoc
class __$$CategoryComparisonImplCopyWithImpl<$Res>
    extends _$CategoryComparisonCopyWithImpl<$Res, _$CategoryComparisonImpl>
    implements _$$CategoryComparisonImplCopyWith<$Res> {
  __$$CategoryComparisonImplCopyWithImpl(_$CategoryComparisonImpl _value,
      $Res Function(_$CategoryComparisonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? month = null,
    Object? year = null,
    Object? totalSpent = null,
    Object? budgetAmount = null,
    Object? percentageUsed = null,
    Object? color = freezed,
  }) {
    return _then(_$CategoryComparisonImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryComparisonImpl implements _CategoryComparison {
  const _$CategoryComparisonImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      required this.month,
      required this.year,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'budget_amount') this.budgetAmount = 0,
      @JsonKey(name: 'percentage_used') this.percentageUsed = 0,
      this.color});

  factory _$CategoryComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryComparisonImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'budget_amount')
  final double budgetAmount;
  @override
  @JsonKey(name: 'percentage_used')
  final double percentageUsed;
  @override
  final String? color;

  @override
  String toString() {
    return 'CategoryComparison(categoryId: $categoryId, categoryName: $categoryName, month: $month, year: $year, totalSpent: $totalSpent, budgetAmount: $budgetAmount, percentageUsed: $percentageUsed, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryComparisonImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName, month,
      year, totalSpent, budgetAmount, percentageUsed, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryComparisonImplCopyWith<_$CategoryComparisonImpl> get copyWith =>
      __$$CategoryComparisonImplCopyWithImpl<_$CategoryComparisonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryComparisonImplToJson(
      this,
    );
  }
}

abstract class _CategoryComparison implements CategoryComparison {
  const factory _CategoryComparison(
      {@JsonKey(name: 'category_id') required final String categoryId,
      @JsonKey(name: 'category_name') required final String categoryName,
      required final int month,
      required final int year,
      @JsonKey(name: 'total_spent') final double totalSpent,
      @JsonKey(name: 'budget_amount') final double budgetAmount,
      @JsonKey(name: 'percentage_used') final double percentageUsed,
      final String? color}) = _$CategoryComparisonImpl;

  factory _CategoryComparison.fromJson(Map<String, dynamic> json) =
      _$CategoryComparisonImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'budget_amount')
  double get budgetAmount;
  @override
  @JsonKey(name: 'percentage_used')
  double get percentageUsed;
  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$CategoryComparisonImplCopyWith<_$CategoryComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopSpendingCategory _$TopSpendingCategoryFromJson(Map<String, dynamic> json) {
  return _TopSpendingCategory.fromJson(json);
}

/// @nodoc
mixin _$TopSpendingCategory {
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_count')
  int get transactionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_of_total')
  double get percentageOfTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopSpendingCategoryCopyWith<TopSpendingCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopSpendingCategoryCopyWith<$Res> {
  factory $TopSpendingCategoryCopyWith(
          TopSpendingCategory value, $Res Function(TopSpendingCategory) then) =
      _$TopSpendingCategoryCopyWithImpl<$Res, TopSpendingCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'transaction_count') int transactionCount,
      @JsonKey(name: 'percentage_of_total') double percentageOfTotal});
}

/// @nodoc
class _$TopSpendingCategoryCopyWithImpl<$Res, $Val extends TopSpendingCategory>
    implements $TopSpendingCategoryCopyWith<$Res> {
  _$TopSpendingCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? totalSpent = null,
    Object? transactionCount = null,
    Object? percentageOfTotal = null,
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
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      percentageOfTotal: null == percentageOfTotal
          ? _value.percentageOfTotal
          : percentageOfTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopSpendingCategoryImplCopyWith<$Res>
    implements $TopSpendingCategoryCopyWith<$Res> {
  factory _$$TopSpendingCategoryImplCopyWith(_$TopSpendingCategoryImpl value,
          $Res Function(_$TopSpendingCategoryImpl) then) =
      __$$TopSpendingCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'transaction_count') int transactionCount,
      @JsonKey(name: 'percentage_of_total') double percentageOfTotal});
}

/// @nodoc
class __$$TopSpendingCategoryImplCopyWithImpl<$Res>
    extends _$TopSpendingCategoryCopyWithImpl<$Res, _$TopSpendingCategoryImpl>
    implements _$$TopSpendingCategoryImplCopyWith<$Res> {
  __$$TopSpendingCategoryImplCopyWithImpl(_$TopSpendingCategoryImpl _value,
      $Res Function(_$TopSpendingCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? totalSpent = null,
    Object? transactionCount = null,
    Object? percentageOfTotal = null,
  }) {
    return _then(_$TopSpendingCategoryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      percentageOfTotal: null == percentageOfTotal
          ? _value.percentageOfTotal
          : percentageOfTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopSpendingCategoryImpl implements _TopSpendingCategory {
  const _$TopSpendingCategoryImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'total_spent') required this.totalSpent,
      @JsonKey(name: 'transaction_count') this.transactionCount = 0,
      @JsonKey(name: 'percentage_of_total') this.percentageOfTotal = 0});

  factory _$TopSpendingCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopSpendingCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'transaction_count')
  final int transactionCount;
  @override
  @JsonKey(name: 'percentage_of_total')
  final double percentageOfTotal;

  @override
  String toString() {
    return 'TopSpendingCategory(categoryId: $categoryId, categoryName: $categoryName, totalSpent: $totalSpent, transactionCount: $transactionCount, percentageOfTotal: $percentageOfTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopSpendingCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.percentageOfTotal, percentageOfTotal) ||
                other.percentageOfTotal == percentageOfTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      totalSpent, transactionCount, percentageOfTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopSpendingCategoryImplCopyWith<_$TopSpendingCategoryImpl> get copyWith =>
      __$$TopSpendingCategoryImplCopyWithImpl<_$TopSpendingCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopSpendingCategoryImplToJson(
      this,
    );
  }
}

abstract class _TopSpendingCategory implements TopSpendingCategory {
  const factory _TopSpendingCategory(
      {@JsonKey(name: 'category_id') required final String categoryId,
      @JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'total_spent') required final double totalSpent,
      @JsonKey(name: 'transaction_count') final int transactionCount,
      @JsonKey(name: 'percentage_of_total')
      final double percentageOfTotal}) = _$TopSpendingCategoryImpl;

  factory _TopSpendingCategory.fromJson(Map<String, dynamic> json) =
      _$TopSpendingCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'transaction_count')
  int get transactionCount;
  @override
  @JsonKey(name: 'percentage_of_total')
  double get percentageOfTotal;
  @override
  @JsonKey(ignore: true)
  _$$TopSpendingCategoryImplCopyWith<_$TopSpendingCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryPerformance _$CategoryPerformanceFromJson(Map<String, dynamic> json) {
  return _CategoryPerformance.fromJson(json);
}

/// @nodoc
mixin _$CategoryPerformance {
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_amount')
  double get budgetAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'spent_amount')
  double get spentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_used')
  double get percentageUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_over_budget')
  bool get isOverBudget => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryPerformanceCopyWith<CategoryPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryPerformanceCopyWith<$Res> {
  factory $CategoryPerformanceCopyWith(
          CategoryPerformance value, $Res Function(CategoryPerformance) then) =
      _$CategoryPerformanceCopyWithImpl<$Res, CategoryPerformance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'spent_amount') double spentAmount,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'is_over_budget') bool isOverBudget});
}

/// @nodoc
class _$CategoryPerformanceCopyWithImpl<$Res, $Val extends CategoryPerformance>
    implements $CategoryPerformanceCopyWith<$Res> {
  _$CategoryPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
    Object? percentageUsed = null,
    Object? isOverBudget = null,
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
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      isOverBudget: null == isOverBudget
          ? _value.isOverBudget
          : isOverBudget // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryPerformanceImplCopyWith<$Res>
    implements $CategoryPerformanceCopyWith<$Res> {
  factory _$$CategoryPerformanceImplCopyWith(_$CategoryPerformanceImpl value,
          $Res Function(_$CategoryPerformanceImpl) then) =
      __$$CategoryPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'budget_amount') double budgetAmount,
      @JsonKey(name: 'spent_amount') double spentAmount,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      @JsonKey(name: 'is_over_budget') bool isOverBudget});
}

/// @nodoc
class __$$CategoryPerformanceImplCopyWithImpl<$Res>
    extends _$CategoryPerformanceCopyWithImpl<$Res, _$CategoryPerformanceImpl>
    implements _$$CategoryPerformanceImplCopyWith<$Res> {
  __$$CategoryPerformanceImplCopyWithImpl(_$CategoryPerformanceImpl _value,
      $Res Function(_$CategoryPerformanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? budgetAmount = null,
    Object? spentAmount = null,
    Object? percentageUsed = null,
    Object? isOverBudget = null,
  }) {
    return _then(_$CategoryPerformanceImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      budgetAmount: null == budgetAmount
          ? _value.budgetAmount
          : budgetAmount // ignore: cast_nullable_to_non_nullable
              as double,
      spentAmount: null == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      isOverBudget: null == isOverBudget
          ? _value.isOverBudget
          : isOverBudget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryPerformanceImpl implements _CategoryPerformance {
  const _$CategoryPerformanceImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'budget_amount') this.budgetAmount = 0,
      @JsonKey(name: 'spent_amount') this.spentAmount = 0,
      @JsonKey(name: 'percentage_used') this.percentageUsed = 0,
      @JsonKey(name: 'is_over_budget') this.isOverBudget = false});

  factory _$CategoryPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryPerformanceImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'budget_amount')
  final double budgetAmount;
  @override
  @JsonKey(name: 'spent_amount')
  final double spentAmount;
  @override
  @JsonKey(name: 'percentage_used')
  final double percentageUsed;
  @override
  @JsonKey(name: 'is_over_budget')
  final bool isOverBudget;

  @override
  String toString() {
    return 'CategoryPerformance(categoryId: $categoryId, categoryName: $categoryName, budgetAmount: $budgetAmount, spentAmount: $spentAmount, percentageUsed: $percentageUsed, isOverBudget: $isOverBudget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryPerformanceImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.budgetAmount, budgetAmount) ||
                other.budgetAmount == budgetAmount) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            (identical(other.isOverBudget, isOverBudget) ||
                other.isOverBudget == isOverBudget));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName,
      budgetAmount, spentAmount, percentageUsed, isOverBudget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryPerformanceImplCopyWith<_$CategoryPerformanceImpl> get copyWith =>
      __$$CategoryPerformanceImplCopyWithImpl<_$CategoryPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryPerformanceImplToJson(
      this,
    );
  }
}

abstract class _CategoryPerformance implements CategoryPerformance {
  const factory _CategoryPerformance(
          {@JsonKey(name: 'category_id') required final String categoryId,
          @JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'budget_amount') final double budgetAmount,
          @JsonKey(name: 'spent_amount') final double spentAmount,
          @JsonKey(name: 'percentage_used') final double percentageUsed,
          @JsonKey(name: 'is_over_budget') final bool isOverBudget}) =
      _$CategoryPerformanceImpl;

  factory _CategoryPerformance.fromJson(Map<String, dynamic> json) =
      _$CategoryPerformanceImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'budget_amount')
  double get budgetAmount;
  @override
  @JsonKey(name: 'spent_amount')
  double get spentAmount;
  @override
  @JsonKey(name: 'percentage_used')
  double get percentageUsed;
  @override
  @JsonKey(name: 'is_over_budget')
  bool get isOverBudget;
  @override
  @JsonKey(ignore: true)
  _$$CategoryPerformanceImplCopyWith<_$CategoryPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetPerformance _$BudgetPerformanceFromJson(Map<String, dynamic> json) {
  return _BudgetPerformance.fromJson(json);
}

/// @nodoc
mixin _$BudgetPerformance {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_budget')
  double get totalBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_used')
  double get percentageUsed => throw _privateConstructorUsedError;
  List<CategoryPerformance> get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetPerformanceCopyWith<BudgetPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPerformanceCopyWith<$Res> {
  factory $BudgetPerformanceCopyWith(
          BudgetPerformance value, $Res Function(BudgetPerformance) then) =
      _$BudgetPerformanceCopyWithImpl<$Res, BudgetPerformance>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      List<CategoryPerformance> categories});
}

/// @nodoc
class _$BudgetPerformanceCopyWithImpl<$Res, $Val extends BudgetPerformance>
    implements $BudgetPerformanceCopyWith<$Res> {
  _$BudgetPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? percentageUsed = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryPerformance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetPerformanceImplCopyWith<$Res>
    implements $BudgetPerformanceCopyWith<$Res> {
  factory _$$BudgetPerformanceImplCopyWith(_$BudgetPerformanceImpl value,
          $Res Function(_$BudgetPerformanceImpl) then) =
      __$$BudgetPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'percentage_used') double percentageUsed,
      List<CategoryPerformance> categories});
}

/// @nodoc
class __$$BudgetPerformanceImplCopyWithImpl<$Res>
    extends _$BudgetPerformanceCopyWithImpl<$Res, _$BudgetPerformanceImpl>
    implements _$$BudgetPerformanceImplCopyWith<$Res> {
  __$$BudgetPerformanceImplCopyWithImpl(_$BudgetPerformanceImpl _value,
      $Res Function(_$BudgetPerformanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? percentageUsed = null,
    Object? categories = null,
  }) {
    return _then(_$BudgetPerformanceImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      percentageUsed: null == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryPerformance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetPerformanceImpl implements _BudgetPerformance {
  const _$BudgetPerformanceImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'total_budget') this.totalBudget = 0,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'percentage_used') this.percentageUsed = 0,
      final List<CategoryPerformance> categories = const []})
      : _categories = categories;

  factory _$BudgetPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetPerformanceImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'total_budget')
  final double totalBudget;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'percentage_used')
  final double percentageUsed;
  final List<CategoryPerformance> _categories;
  @override
  @JsonKey()
  List<CategoryPerformance> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'BudgetPerformance(month: $month, year: $year, totalBudget: $totalBudget, totalSpent: $totalSpent, percentageUsed: $percentageUsed, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetPerformanceImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      month,
      year,
      totalBudget,
      totalSpent,
      percentageUsed,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetPerformanceImplCopyWith<_$BudgetPerformanceImpl> get copyWith =>
      __$$BudgetPerformanceImplCopyWithImpl<_$BudgetPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetPerformanceImplToJson(
      this,
    );
  }
}

abstract class _BudgetPerformance implements BudgetPerformance {
  const factory _BudgetPerformance(
      {required final int month,
      required final int year,
      @JsonKey(name: 'total_budget') final double totalBudget,
      @JsonKey(name: 'total_spent') final double totalSpent,
      @JsonKey(name: 'percentage_used') final double percentageUsed,
      final List<CategoryPerformance> categories}) = _$BudgetPerformanceImpl;

  factory _BudgetPerformance.fromJson(Map<String, dynamic> json) =
      _$BudgetPerformanceImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'total_budget')
  double get totalBudget;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'percentage_used')
  double get percentageUsed;
  @override
  List<CategoryPerformance> get categories;
  @override
  @JsonKey(ignore: true)
  _$$BudgetPerformanceImplCopyWith<_$BudgetPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
