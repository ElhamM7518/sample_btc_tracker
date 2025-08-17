part of 'btc_bloc.dart';

@Freezed(when: FreezedWhenOptions.none, map: FreezedMapOptions.none)
sealed class BtcState with _$BtcState {
  const factory BtcState.initial() = BtcInitial;
  const factory BtcState.loading() = BtcLoading;
  const factory BtcState.loadFailure(CommonFailure failure) = BtcLoadFailure;
  const factory BtcState.loadSuccess({
    required DateTime timeStamp,
    // This list keeps the fresh price of each currency
    required List<CurrencyPriceEntity> currencyPrices,
    // This Map is used to keep the price history of each currency to be able to show the price history chart
    required Map<Currency, List<CurrencyPriceEntity>> currencyPricesHistory,
    @Default(false) bool isRefreshing,
    CommonFailure? failedToRefresh,
  }) = BtcLoadSuccess;
}
