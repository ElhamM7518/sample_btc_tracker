// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) =>
    _MetadataModel(
      timestamp: (json['timestamp'] as num).toInt(),
      numCryptocurrencies: (json['num_cryptocurrencies'] as num).toInt(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$MetadataModelToJson(_MetadataModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'num_cryptocurrencies': instance.numCryptocurrencies,
      'error': instance.error,
    };
