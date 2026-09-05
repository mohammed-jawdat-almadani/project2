// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WithdrawalItemModel _$WithdrawalItemModelFromJson(Map<String, dynamic> json) =>
    _WithdrawalItemModel(
      id: (json['id'] as num).toInt(),
      amount: json['amount'],
      status: json['status'] as String? ?? 'processing',
      shamCashNumber: json['sham_cash_number'] as String?,
      shamCashName: json['sham_cash_name'] as String?,
      hasReceipt: json['has_receipt'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
    );

Map<String, dynamic> _$WithdrawalItemModelToJson(
  _WithdrawalItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'status': instance.status,
  'sham_cash_number': instance.shamCashNumber,
  'sham_cash_name': instance.shamCashName,
  'has_receipt': instance.hasReceipt,
  'created_at': instance.createdAt,
  'rejection_reason': instance.rejectionReason,
};
