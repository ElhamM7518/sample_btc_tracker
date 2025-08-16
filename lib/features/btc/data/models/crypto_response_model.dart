import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_btc_tracker/features/btc/data/models/crypto_data_model.dart';
import 'package:sample_btc_tracker/features/btc/data/models/metadata_model.dart';

part 'crypto_response_model.freezed.dart';
part 'crypto_response_model.g.dart';

@freezed
sealed class CryptoResponseModel with _$CryptoResponseModel {
  const factory CryptoResponseModel({
    required Map<String, CryptoDataModel> data,
    required MetadataModel metadata,
  }) = _CryptoResponseModel;

  factory CryptoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseModelFromJson(json);
}
