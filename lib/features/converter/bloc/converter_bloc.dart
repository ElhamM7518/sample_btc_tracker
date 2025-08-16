import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';

part 'converter_event.dart';
part 'converter_state.dart';
part 'converter_bloc.freezed.dart';

@lazySingleton
class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc()
    : super(
        const ConverterState(
          currencyToBtc: true,
          selectedCurrency: Currency.usd,
          currencyAmount: 1,
          btcAmount: 1,
        ),
      ) {
    on<ConverterEvent>((event, emit) {
      switch (event) {
        case _CurrencyChanged():
          _onCurrencyChanged(event, emit);
        case _CurrencyAmountChanged():
          _onCurrencyAmountChanged(event, emit);
        case _BtcAmountChanged():
          _onBtcAmountChanged(event, emit);
        case _ConverterDirectionChanged():
          _onConverterDirectionChanged(event, emit);
        case _CurrencyPriceUpdated():
          _onCurrencyPriceUpdated(event, emit);
      }
    });
  }

  void _onCurrencyChanged(
    _CurrencyChanged event,
    Emitter<ConverterState> emit,
  ) {
    emit(state.copyWith(selectedCurrency: event.currency));
    add(_CurrencyPriceUpdated(event.currentPrice));
  }

  void _onCurrencyAmountChanged(
    _CurrencyAmountChanged event,
    Emitter<ConverterState> emit,
  ) {
    emit(
      state.copyWith(
        currencyAmount: event.amount,
        btcAmount: event.amount / event.currentPrice.price,
      ),
    );
  }

  void _onBtcAmountChanged(
    _BtcAmountChanged event,
    Emitter<ConverterState> emit,
  ) {
    emit(
      state.copyWith(
        currencyAmount: event.amount * event.currentPrice.price,
        btcAmount: event.amount,
      ),
    );
  }

  void _onConverterDirectionChanged(
    _ConverterDirectionChanged event,
    Emitter<ConverterState> emit,
  ) {
    emit(state.copyWith(currencyToBtc: !state.currencyToBtc));
  }

  void _onCurrencyPriceUpdated(
    _CurrencyPriceUpdated event,
    Emitter<ConverterState> emit,
  ) {
    emit(
      state.copyWith(
        currencyAmount: state.currencyToBtc
            ? state.currencyAmount
            : state.btcAmount * event.currencyPrice.price,
        btcAmount: state.currencyToBtc
            ? state.currencyAmount / event.currencyPrice.price
            : state.btcAmount,
      ),
    );
  }
}
