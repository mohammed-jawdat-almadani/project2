// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_part_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuotePartModel _$QuotePartModelFromJson(Map<String, dynamic> json) =>
    _QuotePartModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      price: json['price'],
      classification: json['classification'] as String? ?? 'standard',
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$QuotePartModelToJson(_QuotePartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'classification': instance.classification,
      'image_url': instance.imageUrl,
    };
