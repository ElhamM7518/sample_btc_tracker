import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_btc_tracker/features/btc/domain/currency_enum.dart';

part 'currency_price_entity.freezed.dart';

@freezed
sealed class CurrencyPriceEntity with _$CurrencyPriceEntity {
  const factory CurrencyPriceEntity({
    required Currency currency,
    required double price,
    required DateTime timeStamp,
  }) = _CurrencyPriceEntity;
}
