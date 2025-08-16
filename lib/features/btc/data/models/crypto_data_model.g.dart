// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CryptoDataModel _$CryptoDataModelFromJson(Map<String, dynamic> json) =>
    _CryptoDataModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      websiteSlug: json['website_slug'] as String,
      rank: (json['rank'] as num).toInt(),
      circulatingSupply: json['circulating_supply'] as num,
      totalSupply: json['total_supply'] as num,
      maxSupply: json['max_supply'] as num?,
      quotes: (json['quotes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, QuoteModel.fromJson(e as Map<String, dynamic>)),
      ),
      lastUpdated: (json['last_updated'] as num).toInt(),
    );

Map<String, dynamic> _$CryptoDataModelToJson(_CryptoDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'website_slug': instance.websiteSlug,
      'rank': instance.rank,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'quotes': instance.quotes,
      'last_updated': instance.lastUpdated,
    };
