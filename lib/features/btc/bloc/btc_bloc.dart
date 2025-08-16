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
                currencyPricesHistory: currencyPricesHistory,
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
                  currencyPrices: currencyPrices,
                  currencyPricesHistory: currencyPricesHistory,
                  timeStamp: timeStamp,
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
                EnvironmentVariables.environment == Environment.test
                    ? const Duration(milliseconds: 5)
                    : const Duration(minutes: 1),
                (ticker) => add(const _Loaded()),
              );
            case BtcLoadSuccess(:final currencyPricesHistory):
              emit(
                BtcState.loadSuccess(
                  currencyPrices: [...eurData, gbpData.last],
                  currencyPricesHistory: _appendHistory(
                    currencyPricesHistory,
                    eurData.first.copyWith(timeStamp: gbpData.last.timeStamp),
                    gbpData.last,
                    eurData.last.copyWith(timeStamp: gbpData.last.timeStamp),
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

  Map<Currency, List<CurrencyPriceEntity>> _appendHistory(
    Map<Currency, List<CurrencyPriceEntity>> currentHistory,
    CurrencyPriceEntity usdPrice,
    CurrencyPriceEntity gbpPrice,
    CurrencyPriceEntity eurPrice,
  ) {
    return {
      Currency.usd: [...currentHistory[Currency.usd]!, usdPrice],
      Currency.gbp: [...currentHistory[Currency.gbp]!, gbpPrice],
      Currency.eur: [...currentHistory[Currency.eur]!, eurPrice],
    };
  }
}
