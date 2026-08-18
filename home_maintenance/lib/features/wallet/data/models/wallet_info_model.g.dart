// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletInfoModel _$WalletInfoModelFromJson(Map<String, dynamic> json) =>
    _WalletInfoModel(
      availableBalance: json['available_balance'] ?? '0.00',
      heldBalance: json['held_balance'] ?? '0.00',
      currency: json['currency'] as String? ?? 'SYP',
    );

Map<String, dynamic> _$WalletInfoModelToJson(_WalletInfoModel instance) =>
    <String, dynamic>{
      'available_balance': instance.availableBalance,
      'held_balance': instance.heldBalance,
      'currency': instance.currency,
    };
