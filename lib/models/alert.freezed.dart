// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetAlert _$BudgetAlertFromJson(Map<String, dynamic> json) {
  return _BudgetAlert.fromJson(json);
}

/// @nodoc
mixin _$BudgetAlert {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'threshold_percentage')
  int get thresholdPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_enabled')
  bool get isEnabled => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_triggered')
  DateTime? get lastTriggered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetAlertCopyWith<BudgetAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetAlertCopyWith<$Res> {
  factory $BudgetAlertCopyWith(
          BudgetAlert value, $Res Function(BudgetAlert) then) =
      _$BudgetAlertCopyWithImpl<$Res, BudgetAlert>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'threshold_percentage') int thresholdPercentage,
      @JsonKey(name: 'is_enabled') bool isEnabled,
      String status,
      String? level,
      String? message,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'last_triggered') DateTime? lastTriggered});
}

/// @nodoc
class _$BudgetAlertCopyWithImpl<$Res, $Val extends BudgetAlert>
    implements $BudgetAlertCopyWith<$Res> {
  _$BudgetAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? thresholdPercentage = null,
    Object? isEnabled = null,
    Object? status = null,
    Object? level = freezed,
    Object? message = freezed,
    Object? createdAt = null,
    Object? lastTriggered = freezed,
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
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      thresholdPercentage: null == thresholdPercentage
          ? _value.thresholdPercentage
          : thresholdPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTriggered: freezed == lastTriggered
          ? _value.lastTriggered
          : lastTriggered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetAlertImplCopyWith<$Res>
    implements $BudgetAlertCopyWith<$Res> {
  factory _$$BudgetAlertImplCopyWith(
          _$BudgetAlertImpl value, $Res Function(_$BudgetAlertImpl) then) =
      __$$BudgetAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'threshold_percentage') int thresholdPercentage,
      @JsonKey(name: 'is_enabled') bool isEnabled,
      String status,
      String? level,
      String? message,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'last_triggered') DateTime? lastTriggered});
}

/// @nodoc
class __$$BudgetAlertImplCopyWithImpl<$Res>
    extends _$BudgetAlertCopyWithImpl<$Res, _$BudgetAlertImpl>
    implements _$$BudgetAlertImplCopyWith<$Res> {
  __$$BudgetAlertImplCopyWithImpl(
      _$BudgetAlertImpl _value, $Res Function(_$BudgetAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? thresholdPercentage = null,
    Object? isEnabled = null,
    Object? status = null,
    Object? level = freezed,
    Object? message = freezed,
    Object? createdAt = null,
    Object? lastTriggered = freezed,
  }) {
    return _then(_$BudgetAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      thresholdPercentage: null == thresholdPercentage
          ? _value.thresholdPercentage
          : thresholdPercentage // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastTriggered: freezed == lastTriggered
          ? _value.lastTriggered
          : lastTriggered // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetAlertImpl implements _BudgetAlert {
  const _$BudgetAlertImpl(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'threshold_percentage') this.thresholdPercentage = 80,
      @JsonKey(name: 'is_enabled') this.isEnabled = true,
      this.status = 'active',
      this.level,
      this.message,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'last_triggered') this.lastTriggered});

  factory _$BudgetAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetAlertImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'threshold_percentage')
  final int thresholdPercentage;
  @override
  @JsonKey(name: 'is_enabled')
  final bool isEnabled;
  @override
  @JsonKey()
  final String status;
  @override
  final String? level;
  @override
  final String? message;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'last_triggered')
  final DateTime? lastTriggered;

  @override
  String toString() {
    return 'BudgetAlert(id: $id, categoryId: $categoryId, categoryName: $categoryName, thresholdPercentage: $thresholdPercentage, isEnabled: $isEnabled, status: $status, level: $level, message: $message, createdAt: $createdAt, lastTriggered: $lastTriggered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.thresholdPercentage, thresholdPercentage) ||
                other.thresholdPercentage == thresholdPercentage) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastTriggered, lastTriggered) ||
                other.lastTriggered == lastTriggered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      categoryName,
      thresholdPercentage,
      isEnabled,
      status,
      level,
      message,
      createdAt,
      lastTriggered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      __$$BudgetAlertImplCopyWithImpl<_$BudgetAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetAlertImplToJson(
      this,
    );
  }
}

abstract class _BudgetAlert implements BudgetAlert {
  const factory _BudgetAlert(
          {required final String id,
          @JsonKey(name: 'category_id') required final String categoryId,
          @JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'threshold_percentage') final int thresholdPercentage,
          @JsonKey(name: 'is_enabled') final bool isEnabled,
          final String status,
          final String? level,
          final String? message,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'last_triggered') final DateTime? lastTriggered}) =
      _$BudgetAlertImpl;

  factory _BudgetAlert.fromJson(Map<String, dynamic> json) =
      _$BudgetAlertImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'threshold_percentage')
  int get thresholdPercentage;
  @override
  @JsonKey(name: 'is_enabled')
  bool get isEnabled;
  @override
  String get status;
  @override
  String? get level;
  @override
  String? get message;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'last_triggered')
  DateTime? get lastTriggered;
  @override
  @JsonKey(ignore: true)
  _$$BudgetAlertImplCopyWith<_$BudgetAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
