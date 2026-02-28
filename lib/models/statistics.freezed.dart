// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategorySpending _$CategorySpendingFromJson(Map<String, dynamic> json) {
  return _CategorySpending.fromJson(json);
}

/// @nodoc
mixin _$CategorySpending {
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorySpendingCopyWith<CategorySpending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySpendingCopyWith<$Res> {
  factory $CategorySpendingCopyWith(
          CategorySpending value, $Res Function(CategorySpending) then) =
      _$CategorySpendingCopyWithImpl<$Res, CategorySpending>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      double amount,
      double percentage});
}

/// @nodoc
class _$CategorySpendingCopyWithImpl<$Res, $Val extends CategorySpending>
    implements $CategorySpendingCopyWith<$Res> {
  _$CategorySpendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySpendingImplCopyWith<$Res>
    implements $CategorySpendingCopyWith<$Res> {
  factory _$$CategorySpendingImplCopyWith(_$CategorySpendingImpl value,
          $Res Function(_$CategorySpendingImpl) then) =
      __$$CategorySpendingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      double amount,
      double percentage});
}

/// @nodoc
class __$$CategorySpendingImplCopyWithImpl<$Res>
    extends _$CategorySpendingCopyWithImpl<$Res, _$CategorySpendingImpl>
    implements _$$CategorySpendingImplCopyWith<$Res> {
  __$$CategorySpendingImplCopyWithImpl(_$CategorySpendingImpl _value,
      $Res Function(_$CategorySpendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_$CategorySpendingImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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
class _$CategorySpendingImpl implements _CategorySpending {
  const _$CategorySpendingImpl(
      {@JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      required this.amount,
      this.percentage = 0});

  factory _$CategorySpendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySpendingImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  final double amount;
  @override
  @JsonKey()
  final double percentage;

  @override
  String toString() {
    return 'CategorySpending(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySpendingImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, categoryName, amount, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      __$$CategorySpendingImplCopyWithImpl<_$CategorySpendingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySpendingImplToJson(
      this,
    );
  }
}

abstract class _CategorySpending implements CategorySpending {
  const factory _CategorySpending(
      {@JsonKey(name: 'category_id') required final String categoryId,
      @JsonKey(name: 'category_name') required final String categoryName,
      required final double amount,
      final double percentage}) = _$CategorySpendingImpl;

  factory _CategorySpending.fromJson(Map<String, dynamic> json) =
      _$CategorySpendingImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$CategorySpendingImplCopyWith<_$CategorySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyStats _$MonthlyStatsFromJson(Map<String, dynamic> json) {
  return _MonthlyStats.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStats {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_expense')
  double get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_savings')
  double get netSavings => throw _privateConstructorUsedError;
  @JsonKey(name: 'savings_rate')
  double get savingsRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_categories')
  List<CategorySpending> get topCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyStatsCopyWith<MonthlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStatsCopyWith<$Res> {
  factory $MonthlyStatsCopyWith(
          MonthlyStats value, $Res Function(MonthlyStats) then) =
      _$MonthlyStatsCopyWithImpl<$Res, MonthlyStats>;
  @useResult
  $Res call(
      {int year,
      int month,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'net_savings') double netSavings,
      @JsonKey(name: 'savings_rate') double savingsRate,
      @JsonKey(name: 'top_categories') List<CategorySpending> topCategories});
}

/// @nodoc
class _$MonthlyStatsCopyWithImpl<$Res, $Val extends MonthlyStats>
    implements $MonthlyStatsCopyWith<$Res> {
  _$MonthlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? netSavings = null,
    Object? savingsRate = null,
    Object? topCategories = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      netSavings: null == netSavings
          ? _value.netSavings
          : netSavings // ignore: cast_nullable_to_non_nullable
              as double,
      savingsRate: null == savingsRate
          ? _value.savingsRate
          : savingsRate // ignore: cast_nullable_to_non_nullable
              as double,
      topCategories: null == topCategories
          ? _value.topCategories
          : topCategories // ignore: cast_nullable_to_non_nullable
              as List<CategorySpending>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyStatsImplCopyWith<$Res>
    implements $MonthlyStatsCopyWith<$Res> {
  factory _$$MonthlyStatsImplCopyWith(
          _$MonthlyStatsImpl value, $Res Function(_$MonthlyStatsImpl) then) =
      __$$MonthlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      int month,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'net_savings') double netSavings,
      @JsonKey(name: 'savings_rate') double savingsRate,
      @JsonKey(name: 'top_categories') List<CategorySpending> topCategories});
}

/// @nodoc
class __$$MonthlyStatsImplCopyWithImpl<$Res>
    extends _$MonthlyStatsCopyWithImpl<$Res, _$MonthlyStatsImpl>
    implements _$$MonthlyStatsImplCopyWith<$Res> {
  __$$MonthlyStatsImplCopyWithImpl(
      _$MonthlyStatsImpl _value, $Res Function(_$MonthlyStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? netSavings = null,
    Object? savingsRate = null,
    Object? topCategories = null,
  }) {
    return _then(_$MonthlyStatsImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      netSavings: null == netSavings
          ? _value.netSavings
          : netSavings // ignore: cast_nullable_to_non_nullable
              as double,
      savingsRate: null == savingsRate
          ? _value.savingsRate
          : savingsRate // ignore: cast_nullable_to_non_nullable
              as double,
      topCategories: null == topCategories
          ? _value._topCategories
          : topCategories // ignore: cast_nullable_to_non_nullable
              as List<CategorySpending>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyStatsImpl implements _MonthlyStats {
  const _$MonthlyStatsImpl(
      {required this.year,
      required this.month,
      @JsonKey(name: 'total_income') required this.totalIncome,
      @JsonKey(name: 'total_expense') required this.totalExpense,
      @JsonKey(name: 'net_savings') required this.netSavings,
      @JsonKey(name: 'savings_rate') required this.savingsRate,
      @JsonKey(name: 'top_categories')
      final List<CategorySpending> topCategories = const []})
      : _topCategories = topCategories;

  factory _$MonthlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStatsImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'total_expense')
  final double totalExpense;
  @override
  @JsonKey(name: 'net_savings')
  final double netSavings;
  @override
  @JsonKey(name: 'savings_rate')
  final double savingsRate;
  final List<CategorySpending> _topCategories;
  @override
  @JsonKey(name: 'top_categories')
  List<CategorySpending> get topCategories {
    if (_topCategories is EqualUnmodifiableListView) return _topCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topCategories);
  }

  @override
  String toString() {
    return 'MonthlyStats(year: $year, month: $month, totalIncome: $totalIncome, totalExpense: $totalExpense, netSavings: $netSavings, savingsRate: $savingsRate, topCategories: $topCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStatsImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.netSavings, netSavings) ||
                other.netSavings == netSavings) &&
            (identical(other.savingsRate, savingsRate) ||
                other.savingsRate == savingsRate) &&
            const DeepCollectionEquality()
                .equals(other._topCategories, _topCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      month,
      totalIncome,
      totalExpense,
      netSavings,
      savingsRate,
      const DeepCollectionEquality().hash(_topCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      __$$MonthlyStatsImplCopyWithImpl<_$MonthlyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStatsImplToJson(
      this,
    );
  }
}

abstract class _MonthlyStats implements MonthlyStats {
  const factory _MonthlyStats(
      {required final int year,
      required final int month,
      @JsonKey(name: 'total_income') required final double totalIncome,
      @JsonKey(name: 'total_expense') required final double totalExpense,
      @JsonKey(name: 'net_savings') required final double netSavings,
      @JsonKey(name: 'savings_rate') required final double savingsRate,
      @JsonKey(name: 'top_categories')
      final List<CategorySpending> topCategories}) = _$MonthlyStatsImpl;

  factory _MonthlyStats.fromJson(Map<String, dynamic> json) =
      _$MonthlyStatsImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'total_expense')
  double get totalExpense;
  @override
  @JsonKey(name: 'net_savings')
  double get netSavings;
  @override
  @JsonKey(name: 'savings_rate')
  double get savingsRate;
  @override
  @JsonKey(name: 'top_categories')
  List<CategorySpending> get topCategories;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OverviewStats _$OverviewStatsFromJson(Map<String, dynamic> json) {
  return _OverviewStats.fromJson(json);
}

/// @nodoc
mixin _$OverviewStats {
  @JsonKey(name: 'total_balance')
  double get totalBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_income')
  double get monthIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_expense')
  double get monthExpense => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverviewStatsCopyWith<OverviewStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStatsCopyWith<$Res> {
  factory $OverviewStatsCopyWith(
          OverviewStats value, $Res Function(OverviewStats) then) =
      _$OverviewStatsCopyWithImpl<$Res, OverviewStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_balance') double totalBalance,
      @JsonKey(name: 'month_income') double monthIncome,
      @JsonKey(name: 'month_expense') double monthExpense,
      List<Account> accounts});
}

/// @nodoc
class _$OverviewStatsCopyWithImpl<$Res, $Val extends OverviewStats>
    implements $OverviewStatsCopyWith<$Res> {
  _$OverviewStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? monthIncome = null,
    Object? monthExpense = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      monthIncome: null == monthIncome
          ? _value.monthIncome
          : monthIncome // ignore: cast_nullable_to_non_nullable
              as double,
      monthExpense: null == monthExpense
          ? _value.monthExpense
          : monthExpense // ignore: cast_nullable_to_non_nullable
              as double,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OverviewStatsImplCopyWith<$Res>
    implements $OverviewStatsCopyWith<$Res> {
  factory _$$OverviewStatsImplCopyWith(
          _$OverviewStatsImpl value, $Res Function(_$OverviewStatsImpl) then) =
      __$$OverviewStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_balance') double totalBalance,
      @JsonKey(name: 'month_income') double monthIncome,
      @JsonKey(name: 'month_expense') double monthExpense,
      List<Account> accounts});
}

/// @nodoc
class __$$OverviewStatsImplCopyWithImpl<$Res>
    extends _$OverviewStatsCopyWithImpl<$Res, _$OverviewStatsImpl>
    implements _$$OverviewStatsImplCopyWith<$Res> {
  __$$OverviewStatsImplCopyWithImpl(
      _$OverviewStatsImpl _value, $Res Function(_$OverviewStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? monthIncome = null,
    Object? monthExpense = null,
    Object? accounts = null,
  }) {
    return _then(_$OverviewStatsImpl(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      monthIncome: null == monthIncome
          ? _value.monthIncome
          : monthIncome // ignore: cast_nullable_to_non_nullable
              as double,
      monthExpense: null == monthExpense
          ? _value.monthExpense
          : monthExpense // ignore: cast_nullable_to_non_nullable
              as double,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewStatsImpl implements _OverviewStats {
  const _$OverviewStatsImpl(
      {@JsonKey(name: 'total_balance') required this.totalBalance,
      @JsonKey(name: 'month_income') required this.monthIncome,
      @JsonKey(name: 'month_expense') required this.monthExpense,
      final List<Account> accounts = const []})
      : _accounts = accounts;

  factory _$OverviewStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewStatsImplFromJson(json);

  @override
  @JsonKey(name: 'total_balance')
  final double totalBalance;
  @override
  @JsonKey(name: 'month_income')
  final double monthIncome;
  @override
  @JsonKey(name: 'month_expense')
  final double monthExpense;
  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'OverviewStats(totalBalance: $totalBalance, monthIncome: $monthIncome, monthExpense: $monthExpense, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewStatsImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            (identical(other.monthIncome, monthIncome) ||
                other.monthIncome == monthIncome) &&
            (identical(other.monthExpense, monthExpense) ||
                other.monthExpense == monthExpense) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalBalance, monthIncome,
      monthExpense, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewStatsImplCopyWith<_$OverviewStatsImpl> get copyWith =>
      __$$OverviewStatsImplCopyWithImpl<_$OverviewStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewStatsImplToJson(
      this,
    );
  }
}

abstract class _OverviewStats implements OverviewStats {
  const factory _OverviewStats(
      {@JsonKey(name: 'total_balance') required final double totalBalance,
      @JsonKey(name: 'month_income') required final double monthIncome,
      @JsonKey(name: 'month_expense') required final double monthExpense,
      final List<Account> accounts}) = _$OverviewStatsImpl;

  factory _OverviewStats.fromJson(Map<String, dynamic> json) =
      _$OverviewStatsImpl.fromJson;

  @override
  @JsonKey(name: 'total_balance')
  double get totalBalance;
  @override
  @JsonKey(name: 'month_income')
  double get monthIncome;
  @override
  @JsonKey(name: 'month_expense')
  double get monthExpense;
  @override
  List<Account> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$OverviewStatsImplCopyWith<_$OverviewStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
