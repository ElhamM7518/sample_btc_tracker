// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CryptoResponseModel _$CryptoResponseModelFromJson(Map<String, dynamic> json) =>
    _CryptoResponseModel(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CryptoDataModel.fromJson(e as Map<String, dynamic>)),
      ),
      metadata: MetadataModel.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CryptoResponseModelToJson(
  _CryptoResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'metadata': instance.metadata};
