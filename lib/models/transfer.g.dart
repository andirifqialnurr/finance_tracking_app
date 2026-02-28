// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferImpl _$$TransferImplFromJson(Map<String, dynamic> json) =>
    _$TransferImpl(
      id: json['id'] as String,
      fromAccountId: json['from_account_id'] as String,
      toAccountId: json['to_account_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String?,
      transferDate: DateTime.parse(json['transfer_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TransferImplToJson(_$TransferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_account_id': instance.fromAccountId,
      'to_account_id': instance.toAccountId,
      'amount': instance.amount,
      'note': instance.note,
      'transfer_date': instance.transferDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$TransferResultImpl _$$TransferResultImplFromJson(Map<String, dynamic> json) =>
    _$TransferResultImpl(
      transfer: Transfer.fromJson(json['transfer'] as Map<String, dynamic>),
      fromAccountBalance: (json['from_account_balance'] as num).toDouble(),
      toAccountBalance: (json['to_account_balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$TransferResultImplToJson(
        _$TransferResultImpl instance) =>
    <String, dynamic>{
      'transfer': instance.transfer,
      'from_account_balance': instance.fromAccountBalance,
      'to_account_balance': instance.toAccountBalance,
    };
