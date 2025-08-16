part of 'converter_bloc.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  copyWith: false,
)
sealed class ConverterEvent with _$ConverterEvent {
  const factory ConverterEvent.currencyChanged({
    required Currency currency,
    required CurrencyPriceEntity currentPrice,
  }) = _CurrencyChanged;
  const factory ConverterEvent.currencyAmountChanged({
    required double amount,
    required CurrencyPriceEntity currentPrice,
  }) = _CurrencyAmountChanged;
  const factory ConverterEvent.btcAmountChanged({
    required double amount,
    required CurrencyPriceEntity currentPrice,
  }) = _BtcAmountChanged;
  const factory ConverterEvent.converterDirectionChanged() =
      _ConverterDirectionChanged;
  const factory ConverterEvent.currencyPriceUpdated(
    CurrencyPriceEntity currencyPrice,
  ) = _CurrencyPriceUpdated;
}
