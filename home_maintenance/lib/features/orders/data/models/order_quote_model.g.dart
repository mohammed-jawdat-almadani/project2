// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderQuoteModel _$OrderQuoteModelFromJson(Map<String, dynamic> json) =>
    _OrderQuoteModel(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String? ?? 'initial',
      status: json['status'] as String? ?? 'pending',
      laborCost: json['labor_cost'],
      warrantyDays: json['warranty_days'],
      justification: json['justification'] as String?,
      total: json['total'],
      expiresAt: json['expires_at'] as String?,
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map((e) => QuotePartModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderQuoteModelToJson(_OrderQuoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'labor_cost': instance.laborCost,
      'warranty_days': instance.warrantyDays,
      'justification': instance.justification,
      'total': instance.total,
      'expires_at': instance.expiresAt,
      'parts': instance.parts,
    };
