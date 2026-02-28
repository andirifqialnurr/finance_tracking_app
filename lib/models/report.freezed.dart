// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategorySummary _$CategorySummaryFromJson(Map<String, dynamic> json) {
  return _CategorySummary.fromJson(json);
}

/// @nodoc
mixin _$CategorySummary {
  String get name => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorySummaryCopyWith<CategorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySummaryCopyWith<$Res> {
  factory $CategorySummaryCopyWith(
          CategorySummary value, $Res Function(CategorySummary) then) =
      _$CategorySummaryCopyWithImpl<$Res, CategorySummary>;
  @useResult
  $Res call({String name, double spent, double budget, double percentage});
}

/// @nodoc
class _$CategorySummaryCopyWithImpl<$Res, $Val extends CategorySummary>
    implements $CategorySummaryCopyWith<$Res> {
  _$CategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spent = null,
    Object? budget = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySummaryImplCopyWith<$Res>
    implements $CategorySummaryCopyWith<$Res> {
  factory _$$CategorySummaryImplCopyWith(_$CategorySummaryImpl value,
          $Res Function(_$CategorySummaryImpl) then) =
      __$$CategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double spent, double budget, double percentage});
}

/// @nodoc
class __$$CategorySummaryImplCopyWithImpl<$Res>
    extends _$CategorySummaryCopyWithImpl<$Res, _$CategorySummaryImpl>
    implements _$$CategorySummaryImplCopyWith<$Res> {
  __$$CategorySummaryImplCopyWithImpl(
      _$CategorySummaryImpl _value, $Res Function(_$CategorySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spent = null,
    Object? budget = null,
    Object? percentage = null,
  }) {
    return _then(_$CategorySummaryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
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
class _$CategorySummaryImpl implements _CategorySummary {
  const _$CategorySummaryImpl(
      {required this.name,
      required this.spent,
      required this.budget,
      required this.percentage});

  factory _$CategorySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySummaryImplFromJson(json);

  @override
  final String name;
  @override
  final double spent;
  @override
  final double budget;
  @override
  final double percentage;

  @override
  String toString() {
    return 'CategorySummary(name: $name, spent: $spent, budget: $budget, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySummaryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, spent, budget, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      __$$CategorySummaryImplCopyWithImpl<_$CategorySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySummaryImplToJson(
      this,
    );
  }
}

abstract class _CategorySummary implements CategorySummary {
  const factory _CategorySummary(
      {required final String name,
      required final double spent,
      required final double budget,
      required final double percentage}) = _$CategorySummaryImpl;

  factory _CategorySummary.fromJson(Map<String, dynamic> json) =
      _$CategorySummaryImpl.fromJson;

  @override
  String get name;
  @override
  double get spent;
  @override
  double get budget;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyReport _$MonthlyReportFromJson(Map<String, dynamic> json) {
  return _MonthlyReport.fromJson(json);
}

/// @nodoc
mixin _$MonthlyReport {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_budget')
  double get totalBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_budget')
  double get remainingBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_allocated')
  double get totalAllocated => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_remaining')
  double get totalRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'unallocated')
  double get unallocated => throw _privateConstructorUsedError;
  @JsonKey(name: 'savings')
  double get savings => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_category')
  String get topCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_category_amount')
  double get topCategoryAmount => throw _privateConstructorUsedError;
  List<CategorySummary> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyReportCopyWith<MonthlyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyReportCopyWith<$Res> {
  factory $MonthlyReportCopyWith(
          MonthlyReport value, $Res Function(MonthlyReport) then) =
      _$MonthlyReportCopyWithImpl<$Res, MonthlyReport>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'remaining_budget') double remainingBudget,
      @JsonKey(name: 'total_allocated') double totalAllocated,
      @JsonKey(name: 'total_remaining') double totalRemaining,
      @JsonKey(name: 'unallocated') double unallocated,
      @JsonKey(name: 'savings') double savings,
      @JsonKey(name: 'top_category') String topCategory,
      @JsonKey(name: 'top_category_amount') double topCategoryAmount,
      List<CategorySummary> categories,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class _$MonthlyReportCopyWithImpl<$Res, $Val extends MonthlyReport>
    implements $MonthlyReportCopyWith<$Res> {
  _$MonthlyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalIncome = null,
    Object? totalSpent = null,
    Object? totalBudget = null,
    Object? remainingBudget = null,
    Object? totalAllocated = null,
    Object? totalRemaining = null,
    Object? unallocated = null,
    Object? savings = null,
    Object? topCategory = null,
    Object? topCategoryAmount = null,
    Object? categories = null,
    Object? generatedAt = freezed,
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
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      remainingBudget: null == remainingBudget
          ? _value.remainingBudget
          : remainingBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalAllocated: null == totalAllocated
          ? _value.totalAllocated
          : totalAllocated // ignore: cast_nullable_to_non_nullable
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
      topCategory: null == topCategory
          ? _value.topCategory
          : topCategory // ignore: cast_nullable_to_non_nullable
              as String,
      topCategoryAmount: null == topCategoryAmount
          ? _value.topCategoryAmount
          : topCategoryAmount // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyReportImplCopyWith<$Res>
    implements $MonthlyReportCopyWith<$Res> {
  factory _$$MonthlyReportImplCopyWith(
          _$MonthlyReportImpl value, $Res Function(_$MonthlyReportImpl) then) =
      __$$MonthlyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'remaining_budget') double remainingBudget,
      @JsonKey(name: 'total_allocated') double totalAllocated,
      @JsonKey(name: 'total_remaining') double totalRemaining,
      @JsonKey(name: 'unallocated') double unallocated,
      @JsonKey(name: 'savings') double savings,
      @JsonKey(name: 'top_category') String topCategory,
      @JsonKey(name: 'top_category_amount') double topCategoryAmount,
      List<CategorySummary> categories,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class __$$MonthlyReportImplCopyWithImpl<$Res>
    extends _$MonthlyReportCopyWithImpl<$Res, _$MonthlyReportImpl>
    implements _$$MonthlyReportImplCopyWith<$Res> {
  __$$MonthlyReportImplCopyWithImpl(
      _$MonthlyReportImpl _value, $Res Function(_$MonthlyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalIncome = null,
    Object? totalSpent = null,
    Object? totalBudget = null,
    Object? remainingBudget = null,
    Object? totalAllocated = null,
    Object? totalRemaining = null,
    Object? unallocated = null,
    Object? savings = null,
    Object? topCategory = null,
    Object? topCategoryAmount = null,
    Object? categories = null,
    Object? generatedAt = freezed,
  }) {
    return _then(_$MonthlyReportImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      remainingBudget: null == remainingBudget
          ? _value.remainingBudget
          : remainingBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalAllocated: null == totalAllocated
          ? _value.totalAllocated
          : totalAllocated // ignore: cast_nullable_to_non_nullable
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
      topCategory: null == topCategory
          ? _value.topCategory
          : topCategory // ignore: cast_nullable_to_non_nullable
              as String,
      topCategoryAmount: null == topCategoryAmount
          ? _value.topCategoryAmount
          : topCategoryAmount // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyReportImpl implements _MonthlyReport {
  const _$MonthlyReportImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'total_income') this.totalIncome = 0,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'total_budget') this.totalBudget = 0,
      @JsonKey(name: 'remaining_budget') this.remainingBudget = 0,
      @JsonKey(name: 'total_allocated') this.totalAllocated = 0,
      @JsonKey(name: 'total_remaining') this.totalRemaining = 0,
      @JsonKey(name: 'unallocated') this.unallocated = 0,
      @JsonKey(name: 'savings') this.savings = 0,
      @JsonKey(name: 'top_category') this.topCategory = '',
      @JsonKey(name: 'top_category_amount') this.topCategoryAmount = 0,
      final List<CategorySummary> categories = const [],
      @JsonKey(name: 'generated_at') this.generatedAt})
      : _categories = categories;

  factory _$MonthlyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyReportImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'total_budget')
  final double totalBudget;
  @override
  @JsonKey(name: 'remaining_budget')
  final double remainingBudget;
  @override
  @JsonKey(name: 'total_allocated')
  final double totalAllocated;
  @override
  @JsonKey(name: 'total_remaining')
  final double totalRemaining;
  @override
  @JsonKey(name: 'unallocated')
  final double unallocated;
  @override
  @JsonKey(name: 'savings')
  final double savings;
  @override
  @JsonKey(name: 'top_category')
  final String topCategory;
  @override
  @JsonKey(name: 'top_category_amount')
  final double topCategoryAmount;
  final List<CategorySummary> _categories;
  @override
  @JsonKey()
  List<CategorySummary> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'generated_at')
  final DateTime? generatedAt;

  @override
  String toString() {
    return 'MonthlyReport(month: $month, year: $year, totalIncome: $totalIncome, totalSpent: $totalSpent, totalBudget: $totalBudget, remainingBudget: $remainingBudget, totalAllocated: $totalAllocated, totalRemaining: $totalRemaining, unallocated: $unallocated, savings: $savings, topCategory: $topCategory, topCategoryAmount: $topCategoryAmount, categories: $categories, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyReportImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.remainingBudget, remainingBudget) ||
                other.remainingBudget == remainingBudget) &&
            (identical(other.totalAllocated, totalAllocated) ||
                other.totalAllocated == totalAllocated) &&
            (identical(other.totalRemaining, totalRemaining) ||
                other.totalRemaining == totalRemaining) &&
            (identical(other.unallocated, unallocated) ||
                other.unallocated == unallocated) &&
            (identical(other.savings, savings) || other.savings == savings) &&
            (identical(other.topCategory, topCategory) ||
                other.topCategory == topCategory) &&
            (identical(other.topCategoryAmount, topCategoryAmount) ||
                other.topCategoryAmount == topCategoryAmount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      month,
      year,
      totalIncome,
      totalSpent,
      totalBudget,
      remainingBudget,
      totalAllocated,
      totalRemaining,
      unallocated,
      savings,
      topCategory,
      topCategoryAmount,
      const DeepCollectionEquality().hash(_categories),
      generatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyReportImplCopyWith<_$MonthlyReportImpl> get copyWith =>
      __$$MonthlyReportImplCopyWithImpl<_$MonthlyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyReportImplToJson(
      this,
    );
  }
}

abstract class _MonthlyReport implements MonthlyReport {
  const factory _MonthlyReport(
          {required final int month,
          required final int year,
          @JsonKey(name: 'total_income') final double totalIncome,
          @JsonKey(name: 'total_spent') final double totalSpent,
          @JsonKey(name: 'total_budget') final double totalBudget,
          @JsonKey(name: 'remaining_budget') final double remainingBudget,
          @JsonKey(name: 'total_allocated') final double totalAllocated,
          @JsonKey(name: 'total_remaining') final double totalRemaining,
          @JsonKey(name: 'unallocated') final double unallocated,
          @JsonKey(name: 'savings') final double savings,
          @JsonKey(name: 'top_category') final String topCategory,
          @JsonKey(name: 'top_category_amount') final double topCategoryAmount,
          final List<CategorySummary> categories,
          @JsonKey(name: 'generated_at') final DateTime? generatedAt}) =
      _$MonthlyReportImpl;

  factory _MonthlyReport.fromJson(Map<String, dynamic> json) =
      _$MonthlyReportImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'total_budget')
  double get totalBudget;
  @override
  @JsonKey(name: 'remaining_budget')
  double get remainingBudget;
  @override
  @JsonKey(name: 'total_allocated')
  double get totalAllocated;
  @override
  @JsonKey(name: 'total_remaining')
  double get totalRemaining;
  @override
  @JsonKey(name: 'unallocated')
  double get unallocated;
  @override
  @JsonKey(name: 'savings')
  double get savings;
  @override
  @JsonKey(name: 'top_category')
  String get topCategory;
  @override
  @JsonKey(name: 'top_category_amount')
  double get topCategoryAmount;
  @override
  List<CategorySummary> get categories;
  @override
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyReportImplCopyWith<_$MonthlyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySummary _$MonthlySummaryFromJson(Map<String, dynamic> json) {
  return _MonthlySummary.fromJson(json);
}

/// @nodoc
mixin _$MonthlySummary {
  String get month => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  double get remaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlySummaryCopyWith<MonthlySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySummaryCopyWith<$Res> {
  factory $MonthlySummaryCopyWith(
          MonthlySummary value, $Res Function(MonthlySummary) then) =
      _$MonthlySummaryCopyWithImpl<$Res, MonthlySummary>;
  @useResult
  $Res call({String month, double income, double spent, double remaining});
}

/// @nodoc
class _$MonthlySummaryCopyWithImpl<$Res, $Val extends MonthlySummary>
    implements $MonthlySummaryCopyWith<$Res> {
  _$MonthlySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? income = null,
    Object? spent = null,
    Object? remaining = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySummaryImplCopyWith<$Res>
    implements $MonthlySummaryCopyWith<$Res> {
  factory _$$MonthlySummaryImplCopyWith(_$MonthlySummaryImpl value,
          $Res Function(_$MonthlySummaryImpl) then) =
      __$$MonthlySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, double income, double spent, double remaining});
}

/// @nodoc
class __$$MonthlySummaryImplCopyWithImpl<$Res>
    extends _$MonthlySummaryCopyWithImpl<$Res, _$MonthlySummaryImpl>
    implements _$$MonthlySummaryImplCopyWith<$Res> {
  __$$MonthlySummaryImplCopyWithImpl(
      _$MonthlySummaryImpl _value, $Res Function(_$MonthlySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? income = null,
    Object? spent = null,
    Object? remaining = null,
  }) {
    return _then(_$MonthlySummaryImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySummaryImpl implements _MonthlySummary {
  const _$MonthlySummaryImpl(
      {required this.month,
      required this.income,
      required this.spent,
      required this.remaining});

  factory _$MonthlySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySummaryImplFromJson(json);

  @override
  final String month;
  @override
  final double income;
  @override
  final double spent;
  @override
  final double remaining;

  @override
  String toString() {
    return 'MonthlySummary(month: $month, income: $income, spent: $spent, remaining: $remaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySummaryImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, income, spent, remaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      __$$MonthlySummaryImplCopyWithImpl<_$MonthlySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySummaryImplToJson(
      this,
    );
  }
}

abstract class _MonthlySummary implements MonthlySummary {
  const factory _MonthlySummary(
      {required final String month,
      required final double income,
      required final double spent,
      required final double remaining}) = _$MonthlySummaryImpl;

  factory _MonthlySummary.fromJson(Map<String, dynamic> json) =
      _$MonthlySummaryImpl.fromJson;

  @override
  String get month;
  @override
  double get income;
  @override
  double get spent;
  @override
  double get remaining;
  @override
  @JsonKey(ignore: true)
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YearlyReport _$YearlyReportFromJson(Map<String, dynamic> json) {
  return _YearlyReport.fromJson(json);
}

/// @nodoc
mixin _$YearlyReport {
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spent')
  double get totalSpent => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_budget')
  double get totalBudget => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_monthly_income')
  double get averageMonthlyIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_monthly_spending')
  double get averageMonthlySpending => throw _privateConstructorUsedError;
  @JsonKey(name: 'highest_spending_month')
  String get highestSpendingMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'lowest_spending_month')
  String get lowestSpendingMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_summaries')
  List<MonthlySummary> get monthlySummaries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YearlyReportCopyWith<YearlyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearlyReportCopyWith<$Res> {
  factory $YearlyReportCopyWith(
          YearlyReport value, $Res Function(YearlyReport) then) =
      _$YearlyReportCopyWithImpl<$Res, YearlyReport>;
  @useResult
  $Res call(
      {int year,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'average_monthly_income') double averageMonthlyIncome,
      @JsonKey(name: 'average_monthly_spending') double averageMonthlySpending,
      @JsonKey(name: 'highest_spending_month') String highestSpendingMonth,
      @JsonKey(name: 'lowest_spending_month') String lowestSpendingMonth,
      @JsonKey(name: 'monthly_summaries')
      List<MonthlySummary> monthlySummaries});
}

/// @nodoc
class _$YearlyReportCopyWithImpl<$Res, $Val extends YearlyReport>
    implements $YearlyReportCopyWith<$Res> {
  _$YearlyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? totalIncome = null,
    Object? totalSpent = null,
    Object? totalBudget = null,
    Object? averageMonthlyIncome = null,
    Object? averageMonthlySpending = null,
    Object? highestSpendingMonth = null,
    Object? lowestSpendingMonth = null,
    Object? monthlySummaries = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      averageMonthlyIncome: null == averageMonthlyIncome
          ? _value.averageMonthlyIncome
          : averageMonthlyIncome // ignore: cast_nullable_to_non_nullable
              as double,
      averageMonthlySpending: null == averageMonthlySpending
          ? _value.averageMonthlySpending
          : averageMonthlySpending // ignore: cast_nullable_to_non_nullable
              as double,
      highestSpendingMonth: null == highestSpendingMonth
          ? _value.highestSpendingMonth
          : highestSpendingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      lowestSpendingMonth: null == lowestSpendingMonth
          ? _value.lowestSpendingMonth
          : lowestSpendingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySummaries: null == monthlySummaries
          ? _value.monthlySummaries
          : monthlySummaries // ignore: cast_nullable_to_non_nullable
              as List<MonthlySummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearlyReportImplCopyWith<$Res>
    implements $YearlyReportCopyWith<$Res> {
  factory _$$YearlyReportImplCopyWith(
          _$YearlyReportImpl value, $Res Function(_$YearlyReportImpl) then) =
      __$$YearlyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_spent') double totalSpent,
      @JsonKey(name: 'total_budget') double totalBudget,
      @JsonKey(name: 'average_monthly_income') double averageMonthlyIncome,
      @JsonKey(name: 'average_monthly_spending') double averageMonthlySpending,
      @JsonKey(name: 'highest_spending_month') String highestSpendingMonth,
      @JsonKey(name: 'lowest_spending_month') String lowestSpendingMonth,
      @JsonKey(name: 'monthly_summaries')
      List<MonthlySummary> monthlySummaries});
}

/// @nodoc
class __$$YearlyReportImplCopyWithImpl<$Res>
    extends _$YearlyReportCopyWithImpl<$Res, _$YearlyReportImpl>
    implements _$$YearlyReportImplCopyWith<$Res> {
  __$$YearlyReportImplCopyWithImpl(
      _$YearlyReportImpl _value, $Res Function(_$YearlyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? totalIncome = null,
    Object? totalSpent = null,
    Object? totalBudget = null,
    Object? averageMonthlyIncome = null,
    Object? averageMonthlySpending = null,
    Object? highestSpendingMonth = null,
    Object? lowestSpendingMonth = null,
    Object? monthlySummaries = null,
  }) {
    return _then(_$YearlyReportImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      averageMonthlyIncome: null == averageMonthlyIncome
          ? _value.averageMonthlyIncome
          : averageMonthlyIncome // ignore: cast_nullable_to_non_nullable
              as double,
      averageMonthlySpending: null == averageMonthlySpending
          ? _value.averageMonthlySpending
          : averageMonthlySpending // ignore: cast_nullable_to_non_nullable
              as double,
      highestSpendingMonth: null == highestSpendingMonth
          ? _value.highestSpendingMonth
          : highestSpendingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      lowestSpendingMonth: null == lowestSpendingMonth
          ? _value.lowestSpendingMonth
          : lowestSpendingMonth // ignore: cast_nullable_to_non_nullable
              as String,
      monthlySummaries: null == monthlySummaries
          ? _value._monthlySummaries
          : monthlySummaries // ignore: cast_nullable_to_non_nullable
              as List<MonthlySummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YearlyReportImpl implements _YearlyReport {
  const _$YearlyReportImpl(
      {required this.year,
      @JsonKey(name: 'total_income') this.totalIncome = 0,
      @JsonKey(name: 'total_spent') this.totalSpent = 0,
      @JsonKey(name: 'total_budget') this.totalBudget = 0,
      @JsonKey(name: 'average_monthly_income') this.averageMonthlyIncome = 0,
      @JsonKey(name: 'average_monthly_spending')
      this.averageMonthlySpending = 0,
      @JsonKey(name: 'highest_spending_month') this.highestSpendingMonth = '',
      @JsonKey(name: 'lowest_spending_month') this.lowestSpendingMonth = '',
      @JsonKey(name: 'monthly_summaries')
      final List<MonthlySummary> monthlySummaries = const []})
      : _monthlySummaries = monthlySummaries;

  factory _$YearlyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$YearlyReportImplFromJson(json);

  @override
  final int year;
  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'total_spent')
  final double totalSpent;
  @override
  @JsonKey(name: 'total_budget')
  final double totalBudget;
  @override
  @JsonKey(name: 'average_monthly_income')
  final double averageMonthlyIncome;
  @override
  @JsonKey(name: 'average_monthly_spending')
  final double averageMonthlySpending;
  @override
  @JsonKey(name: 'highest_spending_month')
  final String highestSpendingMonth;
  @override
  @JsonKey(name: 'lowest_spending_month')
  final String lowestSpendingMonth;
  final List<MonthlySummary> _monthlySummaries;
  @override
  @JsonKey(name: 'monthly_summaries')
  List<MonthlySummary> get monthlySummaries {
    if (_monthlySummaries is EqualUnmodifiableListView)
      return _monthlySummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlySummaries);
  }

  @override
  String toString() {
    return 'YearlyReport(year: $year, totalIncome: $totalIncome, totalSpent: $totalSpent, totalBudget: $totalBudget, averageMonthlyIncome: $averageMonthlyIncome, averageMonthlySpending: $averageMonthlySpending, highestSpendingMonth: $highestSpendingMonth, lowestSpendingMonth: $lowestSpendingMonth, monthlySummaries: $monthlySummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearlyReportImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.averageMonthlyIncome, averageMonthlyIncome) ||
                other.averageMonthlyIncome == averageMonthlyIncome) &&
            (identical(other.averageMonthlySpending, averageMonthlySpending) ||
                other.averageMonthlySpending == averageMonthlySpending) &&
            (identical(other.highestSpendingMonth, highestSpendingMonth) ||
                other.highestSpendingMonth == highestSpendingMonth) &&
            (identical(other.lowestSpendingMonth, lowestSpendingMonth) ||
                other.lowestSpendingMonth == lowestSpendingMonth) &&
            const DeepCollectionEquality()
                .equals(other._monthlySummaries, _monthlySummaries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      totalIncome,
      totalSpent,
      totalBudget,
      averageMonthlyIncome,
      averageMonthlySpending,
      highestSpendingMonth,
      lowestSpendingMonth,
      const DeepCollectionEquality().hash(_monthlySummaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YearlyReportImplCopyWith<_$YearlyReportImpl> get copyWith =>
      __$$YearlyReportImplCopyWithImpl<_$YearlyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YearlyReportImplToJson(
      this,
    );
  }
}

abstract class _YearlyReport implements YearlyReport {
  const factory _YearlyReport(
      {required final int year,
      @JsonKey(name: 'total_income') final double totalIncome,
      @JsonKey(name: 'total_spent') final double totalSpent,
      @JsonKey(name: 'total_budget') final double totalBudget,
      @JsonKey(name: 'average_monthly_income')
      final double averageMonthlyIncome,
      @JsonKey(name: 'average_monthly_spending')
      final double averageMonthlySpending,
      @JsonKey(name: 'highest_spending_month')
      final String highestSpendingMonth,
      @JsonKey(name: 'lowest_spending_month') final String lowestSpendingMonth,
      @JsonKey(name: 'monthly_summaries')
      final List<MonthlySummary> monthlySummaries}) = _$YearlyReportImpl;

  factory _YearlyReport.fromJson(Map<String, dynamic> json) =
      _$YearlyReportImpl.fromJson;

  @override
  int get year;
  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'total_spent')
  double get totalSpent;
  @override
  @JsonKey(name: 'total_budget')
  double get totalBudget;
  @override
  @JsonKey(name: 'average_monthly_income')
  double get averageMonthlyIncome;
  @override
  @JsonKey(name: 'average_monthly_spending')
  double get averageMonthlySpending;
  @override
  @JsonKey(name: 'highest_spending_month')
  String get highestSpendingMonth;
  @override
  @JsonKey(name: 'lowest_spending_month')
  String get lowestSpendingMonth;
  @override
  @JsonKey(name: 'monthly_summaries')
  List<MonthlySummary> get monthlySummaries;
  @override
  @JsonKey(ignore: true)
  _$$YearlyReportImplCopyWith<_$YearlyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
