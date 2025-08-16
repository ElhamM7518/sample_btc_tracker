import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_btc_tracker/features/btc/data/models/quote_model.dart';

part 'crypto_data_model.freezed.dart';
part 'crypto_data_model.g.dart';

@freezed
sealed class CryptoDataModel with _$CryptoDataModel {
  const factory CryptoDataModel({
    required int id,
    required String name,
    required String symbol,
    @JsonKey(name: 'website_slug') required String websiteSlug,
    required int rank,
    @JsonKey(name: 'circulating_supply') required num circulatingSupply,
    @JsonKey(name: 'total_supply') required num totalSupply,
    @JsonKey(name: 'max_supply') required num? maxSupply,
    required Map<String, QuoteModel> quotes,
    @JsonKey(name: 'last_updated') required int lastUpdated,
  }) = _CryptoDataModel;

  factory CryptoDataModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataModelFromJson(json);
}
