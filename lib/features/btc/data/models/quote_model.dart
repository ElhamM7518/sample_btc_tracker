import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

@freezed
sealed class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    required double price,
    @JsonKey(name: 'volume_24h') required double volume24h,
    @JsonKey(name: 'market_cap') required double marketCap,
    @JsonKey(name: 'percentage_change_1h') double? percentageChange1h,
    @JsonKey(name: 'percentage_change_24h') double? percentageChange24h,
    @JsonKey(name: 'percentage_change_7d') double? percentageChange7d,
    @JsonKey(name: 'percent_change_1h') double? percentChange1h,
    @JsonKey(name: 'percent_change_24h') double? percentChange24h,
    @JsonKey(name: 'percent_change_7d') double? percentChange7d,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}
