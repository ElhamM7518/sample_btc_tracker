// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => _QuoteModel(
  price: (json['price'] as num).toDouble(),
  volume24h: (json['volume_24h'] as num).toDouble(),
  marketCap: (json['market_cap'] as num).toDouble(),
  percentageChange1h: (json['percentage_change_1h'] as num?)?.toDouble(),
  percentageChange24h: (json['percentage_change_24h'] as num?)?.toDouble(),
  percentageChange7d: (json['percentage_change_7d'] as num?)?.toDouble(),
  percentChange1h: (json['percent_change_1h'] as num?)?.toDouble(),
  percentChange24h: (json['percent_change_24h'] as num?)?.toDouble(),
  percentChange7d: (json['percent_change_7d'] as num?)?.toDouble(),
);

Map<String, dynamic> _$QuoteModelToJson(_QuoteModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'market_cap': instance.marketCap,
      'percentage_change_1h': instance.percentageChange1h,
      'percentage_change_24h': instance.percentageChange24h,
      'percentage_change_7d': instance.percentageChange7d,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
    };
