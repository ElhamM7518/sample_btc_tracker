part of 'converter_bloc.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
sealed class ConverterState with _$ConverterState {
  const factory ConverterState({
    required Currency selectedCurrency,
    required double currencyAmount,
    required double btcAmount,
    required bool currencyToBtc,
  }) = _ConverterState;
}
