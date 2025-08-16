import 'package:bloc_test/bloc_test.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';
import 'package:sample_btc_tracker/features/converter/converter.dart';
import 'package:test/test.dart';

// NOTE: To run the tests, you need to set "Environment == test"
// Use dart-defines to set the Environment => --dart-define=ENVIRONMENT=test

void main() {
  group('ConverterBloc', () {
    final usdCurrencyPrice = CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117490,
      timeStamp: DateTime.parse('2025-08-16T08:00:00.000Z'),
    );
    final euroCurrencyPrice = CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111474.512,
      timeStamp: DateTime.parse('2025-08-16T08:00:00.000Z'),
    );
    final gbpCurrencyPrice = CurrencyPriceEntity(
      currency: Currency.gbp,
      price: 96190.9385000001,
      timeStamp: DateTime.parse('2025-08-16T08:00:01.000Z'),
    );

    ConverterBloc bloc() => ConverterBloc();

    blocTest<ConverterBloc, ConverterState>(
      'emits [ConverterState(amount, Currency.eur)] when [currencyChanged(eur)] added on ConverterState(Currency.usd, currencyToBtc)',
      build: bloc,
      seed: () => const ConverterState(
        currencyAmount: 117490,
        btcAmount: 1,
        selectedCurrency: Currency.usd,
        currencyToBtc: true,
      ),
      act: (bloc) => bloc.add(
        ConverterEvent.currencyChanged(
          currency: Currency.eur,
          currentPrice: euroCurrencyPrice,
        ),
      ),
      expect: () => [
        const ConverterState(
          currencyAmount: 117490,
          btcAmount: 1,
          selectedCurrency: Currency.eur,
          currencyToBtc: true,
        ),
        const ConverterState(
          currencyAmount: 117490,
          btcAmount: 1.0539629005059021,
          selectedCurrency: Currency.eur,
          currencyToBtc: true,
        ),
      ],
    );

    blocTest<ConverterBloc, ConverterState>(
      'emits [ConverterState(amount, Currency.gbp)] when [currencyChanged(gbp)] added on ConverterState(Currency.usd, !currencyToBtc)',
      build: bloc,
      seed: () => const ConverterState(
        currencyAmount: 116326.73267327,
        btcAmount: 1.01,
        selectedCurrency: Currency.usd,
        currencyToBtc: false,
      ),
      act: (bloc) => bloc.add(
        ConverterEvent.currencyChanged(
          currency: Currency.gbp,
          currentPrice: gbpCurrencyPrice,
        ),
      ),
      expect: () => [
        const ConverterState(
          currencyAmount: 116326.73267327,
          btcAmount: 1.01,
          selectedCurrency: Currency.gbp,
          currencyToBtc: false,
        ),
        const ConverterState(
          currencyAmount: 97152.84788500011,
          btcAmount: 1.01,
          selectedCurrency: Currency.gbp,
          currencyToBtc: false,
        ),
      ],
    );

    blocTest<ConverterBloc, ConverterState>(
      'emits [ConverterState(amount, Currency.usd)] when [currencyAmountChanged(1000000)] added on ConverterState(Currency.usd, currencyToBtc)',
      build: bloc,
      seed: () => const ConverterState(
        currencyAmount: 116326.73267327,
        btcAmount: 1.01,
        selectedCurrency: Currency.usd,
        currencyToBtc: true,
      ),
      act: (bloc) => bloc.add(
        ConverterEvent.currencyAmountChanged(
          amount: 1000000,
          currentPrice: usdCurrencyPrice,
        ),
      ),
      expect: () => [
        const ConverterState(
          currencyAmount: 1000000,
          btcAmount: 8.511362669163333,
          selectedCurrency: Currency.usd,
          currencyToBtc: true,
        ),
      ],
    );

    blocTest<ConverterBloc, ConverterState>(
      'emits [ConverterState(amount, Currency.usd)] when [btcAmountChanged(0.9)] added on ConverterState(Currency.usd, !currencyToBtc)',
      build: bloc,
      seed: () => const ConverterState(
        currencyAmount: 116326.73267327,
        btcAmount: 1.01,
        selectedCurrency: Currency.usd,
        currencyToBtc: false,
      ),
      act: (bloc) => bloc.add(
        ConverterEvent.btcAmountChanged(
          amount: 0.9,
          currentPrice: usdCurrencyPrice,
        ),
      ),
      expect: () => [
        const ConverterState(
          currencyAmount: 105741,
          btcAmount: 0.9,
          selectedCurrency: Currency.usd,
          currencyToBtc: false,
        ),
      ],
    );

    blocTest<ConverterBloc, ConverterState>(
      'emits [ConverterState(amount, Currency.usd)] when [converterDirectionChanged] added on ConverterState(!currencyToBtc)',
      build: bloc,
      seed: () => const ConverterState(
        currencyAmount: 116326.73267327,
        btcAmount: 1.01,
        selectedCurrency: Currency.usd,
        currencyToBtc: false,
      ),
      act: (bloc) => bloc.add(const ConverterEvent.converterDirectionChanged()),
      expect: () => [
        const ConverterState(
          currencyAmount: 116326.73267327,
          btcAmount: 1.01,
          selectedCurrency: Currency.usd,
          currencyToBtc: true,
        ),
      ],
    );
  });
}
