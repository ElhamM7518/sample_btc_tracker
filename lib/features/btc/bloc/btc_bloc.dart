import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';

part 'btc_event.dart';
part 'btc_state.dart';
part 'btc_bloc.freezed.dart';

@injectable.lazySingleton
class BtcBloc extends Bloc<BtcEvent, BtcState> {
  final BtcRepository _btcRepository;
  Timer? _refreshTimer;
  final refreshInterval = EnvironmentVariables.environment == Environment.test
      ? const Duration(milliseconds: 5)
      : const Duration(minutes: 1);

  BtcBloc(this._btcRepository) : super(const BtcState.initial()) {
    on<BtcEvent>((event, emit) async {
      switch (event) {
        case _Loaded():
          await _onLoaded(event, emit);
      }
    });
  }

  @override
  Future<void> close() {
    _refreshTimer?.cancel();
    return super.close();
  }

  Future<void> _onLoaded(BtcEvent event, Emitter<BtcState> emit) async {
    switch (state) {
      case BtcLoading():
        return;
      case BtcInitial():
      case BtcLoadFailure():
        emit(const BtcState.loading());
      case BtcLoadSuccess(
        :final currencyPrices,
        :final timeStamp,
        :final currencyPricesHistory,
      ):
        emit(
          BtcState.loadSuccess(
            currencyPrices: currencyPrices,
            currencyPricesHistory: currencyPricesHistory,
            timeStamp: timeStamp,
            isRefreshing: true,
          ),
        );
    }
    // According to the https://api.alternative.me/v2/ticker/bitcoin API, It returns the USD price, besides one other currency
    // as a queryParameter in each call. So, I had to call this API twice to get all three required prices.
    final result = await Future.wait([
      _btcRepository.fetchBtcCurrency(currency: Currency.eur),
      _btcRepository.fetchBtcCurrency(currency: Currency.gbp),
    ]);
    result.first.fold(
      (failure) {
        switch (state) {
          case BtcLoading():
          case BtcLoadFailure():
            emit(BtcState.loadFailure(failure));
          case BtcLoadSuccess(
            :final currencyPrices,
            :final timeStamp,
            :final currencyPricesHistory,
          ):
            emit(
              BtcState.loadSuccess(
                currencyPrices: currencyPrices,
                currencyPricesHistory: currencyPricesHistory,
                timeStamp: timeStamp,
                failedToRefresh: failure,
              ),
            );
            emit(
              BtcState.loadSuccess(
                currencyPrices: currencyPrices,
                // To keep the correct data of CurrencyPricesHistory in every minute
                currencyPricesHistory: _appendHistory(
                  previousHistory: currencyPricesHistory,
                  usdPrice: currencyPricesHistory[Currency.usd]!.last.copyWith(
                    timeStamp: currencyPricesHistory[Currency.gbp]!
                        .last
                        .timeStamp
                        .add(refreshInterval),
                  ),
                  gbpPrice: currencyPricesHistory[Currency.gbp]!.last.copyWith(
                    timeStamp: currencyPricesHistory[Currency.gbp]!
                        .last
                        .timeStamp
                        .add(refreshInterval),
                  ),
                  eurPrice: currencyPricesHistory[Currency.eur]!.last.copyWith(
                    timeStamp: currencyPricesHistory[Currency.gbp]!
                        .last
                        .timeStamp
                        .add(refreshInterval),
                  ),
                ),
                timeStamp: timeStamp,
              ),
            );
          default:
        }
      },
      (eurData) => result.last.fold(
        (failure) {
          switch (state) {
            case BtcLoading():
            case BtcLoadFailure():
              emit(BtcState.loadFailure(failure));
            case BtcLoadSuccess(
              :final currencyPrices,
              :final timeStamp,
              :final currencyPricesHistory,
            ):
              emit(
                BtcState.loadSuccess(
                  currencyPrices: currencyPrices,
                  currencyPricesHistory: currencyPricesHistory,
                  timeStamp: timeStamp,
                  failedToRefresh: failure,
                ),
              );
              emit(
                BtcState.loadSuccess(
                  currencyPrices: [...eurData, currencyPrices.last],
                  currencyPricesHistory: _appendHistory(
                    previousHistory: currencyPricesHistory,
                    usdPrice: eurData.first.copyWith(
                      timeStamp: eurData.last.timeStamp,
                    ),
                    gbpPrice: currencyPricesHistory[Currency.gbp]!.last
                        .copyWith(timeStamp: eurData.last.timeStamp),
                    eurPrice: eurData.last,
                  ),
                  timeStamp: eurData.last.timeStamp,
                ),
              );
            default:
          }
        },
        (gbpData) {
          switch (state) {
            case BtcLoading():
            case BtcLoadFailure():
              emit(
                BtcState.loadSuccess(
                  currencyPrices: [...eurData, gbpData.last],
                  currencyPricesHistory: {
                    Currency.usd: [
                      eurData.first.copyWith(timeStamp: gbpData.last.timeStamp),
                    ],
                    Currency.gbp: [gbpData.last],
                    Currency.eur: [
                      eurData.last.copyWith(timeStamp: gbpData.last.timeStamp),
                    ],
                  },
                  timeStamp: gbpData.last.timeStamp,
                ),
              );
              _refreshTimer = Timer.periodic(
                refreshInterval,
                (ticker) => add(const _Loaded()),
              );
            case BtcLoadSuccess(:final currencyPricesHistory):
              emit(
                BtcState.loadSuccess(
                  currencyPrices: [...eurData, gbpData.last],
                  currencyPricesHistory: _appendHistory(
                    previousHistory: currencyPricesHistory,
                    usdPrice: eurData.first.copyWith(
                      timeStamp: gbpData.last.timeStamp,
                    ),
                    gbpPrice: gbpData.last,
                    eurPrice: eurData.last.copyWith(
                      timeStamp: gbpData.last.timeStamp,
                    ),
                  ),
                  timeStamp: gbpData.last.timeStamp,
                ),
              );
            default:
          }
        },
      ),
    );
  }

  Map<Currency, List<CurrencyPriceEntity>> _appendHistory({
    required Map<Currency, List<CurrencyPriceEntity>> previousHistory,
    required CurrencyPriceEntity usdPrice,
    required CurrencyPriceEntity gbpPrice,
    required CurrencyPriceEntity eurPrice,
  }) {
    return {
      Currency.usd: [...previousHistory[Currency.usd]!, usdPrice],
      Currency.gbp: [...previousHistory[Currency.gbp]!, gbpPrice],
      Currency.eur: [...previousHistory[Currency.eur]!, eurPrice],
    };
  }
}
