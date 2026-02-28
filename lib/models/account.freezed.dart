// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AccountType get type => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  /// Hanya untuk type=CARD: "SALARY" | "PROJECT" | "FREELANCE" | "BUSINESS" | "OTHER"
  @JsonKey(name: 'income_type')
  String? get incomeType => throw _privateConstructorUsedError;

  /// Hanya untuk type=SAVINGS: target saldo
  @JsonKey(name: 'goal_amount')
  double? get goalAmount => throw _privateConstructorUsedError;

  /// Hanya untuk type=SAVINGS: label tujuan
  @JsonKey(name: 'goal_label')
  String? get goalLabel => throw _privateConstructorUsedError;

  /// Hex color (#4CAF50)
  String? get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String id,
      String name,
      AccountType type,
      double balance,
      @JsonKey(name: 'income_type') String? incomeType,
      @JsonKey(name: 'goal_amount') double? goalAmount,
      @JsonKey(name: 'goal_label') String? goalLabel,
      String? color,
      String? description,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

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
    Object? balance = null,
    Object? incomeType = freezed,
    Object? goalAmount = freezed,
    Object? goalLabel = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
              as AccountType,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      incomeType: freezed == incomeType
          ? _value.incomeType
          : incomeType // ignore: cast_nullable_to_non_nullable
              as String?,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      goalLabel: freezed == goalLabel
          ? _value.goalLabel
          : goalLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      AccountType type,
      double balance,
      @JsonKey(name: 'income_type') String? incomeType,
      @JsonKey(name: 'goal_amount') double? goalAmount,
      @JsonKey(name: 'goal_label') String? goalLabel,
      String? color,
      String? description,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? balance = null,
    Object? incomeType = freezed,
    Object? goalAmount = freezed,
    Object? goalLabel = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AccountImpl(
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
              as AccountType,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      incomeType: freezed == incomeType
          ? _value.incomeType
          : incomeType // ignore: cast_nullable_to_non_nullable
              as String?,
      goalAmount: freezed == goalAmount
          ? _value.goalAmount
          : goalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      goalLabel: freezed == goalLabel
          ? _value.goalLabel
          : goalLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.balance,
      @JsonKey(name: 'income_type') this.incomeType,
      @JsonKey(name: 'goal_amount') this.goalAmount,
      @JsonKey(name: 'goal_label') this.goalLabel,
      this.color,
      this.description,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final AccountType type;
  @override
  final double balance;

  /// Hanya untuk type=CARD: "SALARY" | "PROJECT" | "FREELANCE" | "BUSINESS" | "OTHER"
  @override
  @JsonKey(name: 'income_type')
  final String? incomeType;

  /// Hanya untuk type=SAVINGS: target saldo
  @override
  @JsonKey(name: 'goal_amount')
  final double? goalAmount;

  /// Hanya untuk type=SAVINGS: label tujuan
  @override
  @JsonKey(name: 'goal_label')
  final String? goalLabel;

  /// Hex color (#4CAF50)
  @override
  final String? color;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Account(id: $id, name: $name, type: $type, balance: $balance, incomeType: $incomeType, goalAmount: $goalAmount, goalLabel: $goalLabel, color: $color, description: $description, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.incomeType, incomeType) ||
                other.incomeType == incomeType) &&
            (identical(other.goalAmount, goalAmount) ||
                other.goalAmount == goalAmount) &&
            (identical(other.goalLabel, goalLabel) ||
                other.goalLabel == goalLabel) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
      balance,
      incomeType,
      goalAmount,
      goalLabel,
      color,
      description,
      isActive,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
          {required final String id,
          required final String name,
          required final AccountType type,
          required final double balance,
          @JsonKey(name: 'income_type') final String? incomeType,
          @JsonKey(name: 'goal_amount') final double? goalAmount,
          @JsonKey(name: 'goal_label') final String? goalLabel,
          final String? color,
          final String? description,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  AccountType get type;
  @override
  double get balance;
  @override

  /// Hanya untuk type=CARD: "SALARY" | "PROJECT" | "FREELANCE" | "BUSINESS" | "OTHER"
  @JsonKey(name: 'income_type')
  String? get incomeType;
  @override

  /// Hanya untuk type=SAVINGS: target saldo
  @JsonKey(name: 'goal_amount')
  double? get goalAmount;
  @override

  /// Hanya untuk type=SAVINGS: label tujuan
  @JsonKey(name: 'goal_label')
  String? get goalLabel;
  @override

  /// Hex color (#4CAF50)
  String? get color;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountSummary _$AccountSummaryFromJson(Map<String, dynamic> json) {
  return _AccountSummary.fromJson(json);
}

/// @nodoc
mixin _$AccountSummary {
  Account get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_income')
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_expense')
  double get totalExpense => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transfer_in')
  double get totalTransferIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transfer_out')
  double get totalTransferOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_flow')
  double get netFlow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountSummaryCopyWith<AccountSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSummaryCopyWith<$Res> {
  factory $AccountSummaryCopyWith(
          AccountSummary value, $Res Function(AccountSummary) then) =
      _$AccountSummaryCopyWithImpl<$Res, AccountSummary>;
  @useResult
  $Res call(
      {Account account,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'total_transfer_in') double totalTransferIn,
      @JsonKey(name: 'total_transfer_out') double totalTransferOut,
      @JsonKey(name: 'net_flow') double netFlow});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$AccountSummaryCopyWithImpl<$Res, $Val extends AccountSummary>
    implements $AccountSummaryCopyWith<$Res> {
  _$AccountSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? totalTransferIn = null,
    Object? totalTransferOut = null,
    Object? netFlow = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransferIn: null == totalTransferIn
          ? _value.totalTransferIn
          : totalTransferIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransferOut: null == totalTransferOut
          ? _value.totalTransferOut
          : totalTransferOut // ignore: cast_nullable_to_non_nullable
              as double,
      netFlow: null == netFlow
          ? _value.netFlow
          : netFlow // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountSummaryImplCopyWith<$Res>
    implements $AccountSummaryCopyWith<$Res> {
  factory _$$AccountSummaryImplCopyWith(_$AccountSummaryImpl value,
          $Res Function(_$AccountSummaryImpl) then) =
      __$$AccountSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Account account,
      @JsonKey(name: 'total_income') double totalIncome,
      @JsonKey(name: 'total_expense') double totalExpense,
      @JsonKey(name: 'total_transfer_in') double totalTransferIn,
      @JsonKey(name: 'total_transfer_out') double totalTransferOut,
      @JsonKey(name: 'net_flow') double netFlow});

  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$AccountSummaryImplCopyWithImpl<$Res>
    extends _$AccountSummaryCopyWithImpl<$Res, _$AccountSummaryImpl>
    implements _$$AccountSummaryImplCopyWith<$Res> {
  __$$AccountSummaryImplCopyWithImpl(
      _$AccountSummaryImpl _value, $Res Function(_$AccountSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? totalTransferIn = null,
    Object? totalTransferOut = null,
    Object? netFlow = null,
  }) {
    return _then(_$AccountSummaryImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransferIn: null == totalTransferIn
          ? _value.totalTransferIn
          : totalTransferIn // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransferOut: null == totalTransferOut
          ? _value.totalTransferOut
          : totalTransferOut // ignore: cast_nullable_to_non_nullable
              as double,
      netFlow: null == netFlow
          ? _value.netFlow
          : netFlow // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountSummaryImpl implements _AccountSummary {
  const _$AccountSummaryImpl(
      {required this.account,
      @JsonKey(name: 'total_income') this.totalIncome = 0,
      @JsonKey(name: 'total_expense') this.totalExpense = 0,
      @JsonKey(name: 'total_transfer_in') this.totalTransferIn = 0,
      @JsonKey(name: 'total_transfer_out') this.totalTransferOut = 0,
      @JsonKey(name: 'net_flow') this.netFlow = 0});

  factory _$AccountSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountSummaryImplFromJson(json);

  @override
  final Account account;
  @override
  @JsonKey(name: 'total_income')
  final double totalIncome;
  @override
  @JsonKey(name: 'total_expense')
  final double totalExpense;
  @override
  @JsonKey(name: 'total_transfer_in')
  final double totalTransferIn;
  @override
  @JsonKey(name: 'total_transfer_out')
  final double totalTransferOut;
  @override
  @JsonKey(name: 'net_flow')
  final double netFlow;

  @override
  String toString() {
    return 'AccountSummary(account: $account, totalIncome: $totalIncome, totalExpense: $totalExpense, totalTransferIn: $totalTransferIn, totalTransferOut: $totalTransferOut, netFlow: $netFlow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSummaryImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalTransferIn, totalTransferIn) ||
                other.totalTransferIn == totalTransferIn) &&
            (identical(other.totalTransferOut, totalTransferOut) ||
                other.totalTransferOut == totalTransferOut) &&
            (identical(other.netFlow, netFlow) || other.netFlow == netFlow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, account, totalIncome,
      totalExpense, totalTransferIn, totalTransferOut, netFlow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSummaryImplCopyWith<_$AccountSummaryImpl> get copyWith =>
      __$$AccountSummaryImplCopyWithImpl<_$AccountSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountSummaryImplToJson(
      this,
    );
  }
}

abstract class _AccountSummary implements AccountSummary {
  const factory _AccountSummary(
      {required final Account account,
      @JsonKey(name: 'total_income') final double totalIncome,
      @JsonKey(name: 'total_expense') final double totalExpense,
      @JsonKey(name: 'total_transfer_in') final double totalTransferIn,
      @JsonKey(name: 'total_transfer_out') final double totalTransferOut,
      @JsonKey(name: 'net_flow') final double netFlow}) = _$AccountSummaryImpl;

  factory _AccountSummary.fromJson(Map<String, dynamic> json) =
      _$AccountSummaryImpl.fromJson;

  @override
  Account get account;
  @override
  @JsonKey(name: 'total_income')
  double get totalIncome;
  @override
  @JsonKey(name: 'total_expense')
  double get totalExpense;
  @override
  @JsonKey(name: 'total_transfer_in')
  double get totalTransferIn;
  @override
  @JsonKey(name: 'total_transfer_out')
  double get totalTransferOut;
  @override
  @JsonKey(name: 'net_flow')
  double get netFlow;
  @override
  @JsonKey(ignore: true)
  _$$AccountSummaryImplCopyWith<_$AccountSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountsOverview _$AccountsOverviewFromJson(Map<String, dynamic> json) {
  return _AccountsOverview.fromJson(json);
}

/// @nodoc
mixin _$AccountsOverview {
  @JsonKey(name: 'total_balance')
  double get totalBalance => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountsOverviewCopyWith<AccountsOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsOverviewCopyWith<$Res> {
  factory $AccountsOverviewCopyWith(
          AccountsOverview value, $Res Function(AccountsOverview) then) =
      _$AccountsOverviewCopyWithImpl<$Res, AccountsOverview>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_balance') double totalBalance,
      List<Account> accounts});
}

/// @nodoc
class _$AccountsOverviewCopyWithImpl<$Res, $Val extends AccountsOverview>
    implements $AccountsOverviewCopyWith<$Res> {
  _$AccountsOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_value.copyWith(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsOverviewImplCopyWith<$Res>
    implements $AccountsOverviewCopyWith<$Res> {
  factory _$$AccountsOverviewImplCopyWith(_$AccountsOverviewImpl value,
          $Res Function(_$AccountsOverviewImpl) then) =
      __$$AccountsOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_balance') double totalBalance,
      List<Account> accounts});
}

/// @nodoc
class __$$AccountsOverviewImplCopyWithImpl<$Res>
    extends _$AccountsOverviewCopyWithImpl<$Res, _$AccountsOverviewImpl>
    implements _$$AccountsOverviewImplCopyWith<$Res> {
  __$$AccountsOverviewImplCopyWithImpl(_$AccountsOverviewImpl _value,
      $Res Function(_$AccountsOverviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? accounts = null,
  }) {
    return _then(_$AccountsOverviewImpl(
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
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
class _$AccountsOverviewImpl implements _AccountsOverview {
  const _$AccountsOverviewImpl(
      {@JsonKey(name: 'total_balance') this.totalBalance = 0,
      final List<Account> accounts = const []})
      : _accounts = accounts;

  factory _$AccountsOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsOverviewImplFromJson(json);

  @override
  @JsonKey(name: 'total_balance')
  final double totalBalance;
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
    return 'AccountsOverview(totalBalance: $totalBalance, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsOverviewImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalBalance,
      const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsOverviewImplCopyWith<_$AccountsOverviewImpl> get copyWith =>
      __$$AccountsOverviewImplCopyWithImpl<_$AccountsOverviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsOverviewImplToJson(
      this,
    );
  }
}

abstract class _AccountsOverview implements AccountsOverview {
  const factory _AccountsOverview(
      {@JsonKey(name: 'total_balance') final double totalBalance,
      final List<Account> accounts}) = _$AccountsOverviewImpl;

  factory _AccountsOverview.fromJson(Map<String, dynamic> json) =
      _$AccountsOverviewImpl.fromJson;

  @override
  @JsonKey(name: 'total_balance')
  double get totalBalance;
  @override
  List<Account> get accounts;
  @override
  @JsonKey(ignore: true)
  _$$AccountsOverviewImplCopyWith<_$AccountsOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
