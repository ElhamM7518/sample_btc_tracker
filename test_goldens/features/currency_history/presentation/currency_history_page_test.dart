import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';
import 'package:sample_btc_tracker/features/currency_history/presentation/currency_history_page.dart';

import '../../../material_app_wrapper.dart';

class MockBtcBloc extends MockBloc<BtcEvent, BtcState> implements BtcBloc {}

void main() {
  late MockBtcBloc mockBtcBloc;
  final usdCurrencyPrices = [
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117490,
      timeStamp: DateTime.parse('2025-08-16T08:00:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117559.001,
      timeStamp: DateTime.parse('2025-08-16T08:01:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117498.213000,
      timeStamp: DateTime.parse('2025-08-16T08:02:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:03:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:04:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:05:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:06:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117198.8238,
      timeStamp: DateTime.parse('2025-08-16T08:07:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117088.8238,
      timeStamp: DateTime.parse('2025-08-16T08:08:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:09:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117288.8238,
      timeStamp: DateTime.parse('2025-08-16T08:10:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117088.8238,
      timeStamp: DateTime.parse('2025-08-16T08:11:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:12:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 117188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:13:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:14:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119288.8238,
      timeStamp: DateTime.parse('2025-08-16T08:15:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119388.8238,
      timeStamp: DateTime.parse('2025-08-16T08:16:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119088.8238,
      timeStamp: DateTime.parse('2025-08-16T08:17:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 118988.8238,
      timeStamp: DateTime.parse('2025-08-16T08:18:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119188.8238,
      timeStamp: DateTime.parse('2025-08-16T08:19:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119588.8238,
      timeStamp: DateTime.parse('2025-08-16T08:20:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119688.8238,
      timeStamp: DateTime.parse('2025-08-16T08:21:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119488.8238,
      timeStamp: DateTime.parse('2025-08-16T08:22:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119388.8238,
      timeStamp: DateTime.parse('2025-08-16T08:23:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.usd,
      price: 119288.8238,
      timeStamp: DateTime.parse('2025-08-16T08:24:00.000Z'),
    ),
  ];
  final euroCurrencyPrices = [
    CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111474.512,
      timeStamp: DateTime.parse('2025-08-16T08:03:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111474.700,
      timeStamp: DateTime.parse('2025-08-16T08:04:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111476,
      timeStamp: DateTime.parse('2025-08-16T08:08:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111473.3882,
      timeStamp: DateTime.parse('2025-08-16T08:09:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.eur,
      price: 111472,
      timeStamp: DateTime.parse('2025-08-16T08:10:00.000Z'),
    ),
  ];
  final euroCurrencyPrice = CurrencyPriceEntity(
    currency: Currency.eur,
    price: 111474.512,
    timeStamp: DateTime.parse('2025-08-16T08:00:03.000Z'),
  );
  final gbpCurrencyPrices = [
    CurrencyPriceEntity(
      currency: Currency.gbp,
      price: 96190,
      timeStamp: DateTime.parse('2025-08-16T08:03:00.000Z'),
    ),
    CurrencyPriceEntity(
      currency: Currency.gbp,
      price: 96190,
      timeStamp: DateTime.parse('2025-08-16T08:04:00.000Z'),
    ),
  ];
  final gbpCurrencyPrice = CurrencyPriceEntity(
    currency: Currency.gbp,
    price: 96190.9385000001,
    timeStamp: DateTime.parse('2025-08-16T08:00:03.000Z'),
  );

  setUp(() {
    mockBtcBloc = MockBtcBloc();
  });

  Widget buildSubject({Currency currency = Currency.usd}) =>
      BlocProvider<BtcBloc>.value(
        value: mockBtcBloc,
        child: CurrencyHistoryView(currency: currency),
      );

  for (int i = 0; i < 2; i++) {
    testGoldens('Initial', (tester) async {
      whenListen(
        mockBtcBloc,
        const Stream<BtcState>.empty(),
        initialState: const BtcState.initial(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/initial_loading/initial_loading',
      );
    });

    testGoldens('Loading', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(const BtcState.loading()),
        initialState: const BtcState.initial(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/initial_loading/initial_loading',
      );
    });

    testGoldens('NetworkFailure', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          const BtcState.loadFailure(FailureWrapper.networkFailure()),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/network_failure/network_failure',
      );
    });

    testGoldens('UnknownServerFailure', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          const BtcState.loadFailure(FailureWrapper.unknownServerFailure()),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/unknown_failure/unknown_failure',
      );
    });

    testGoldens('ServerFailure', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          const BtcState.loadFailure(
            FailureWrapper.serverFailure(400, 'Invalid Data!'),
          ),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/server_failure/server_failure',
      );
    });

    testGoldens('LoadSuccess', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          BtcState.loadSuccess(
            currencyPrices: [
              usdCurrencyPrices.last,
              euroCurrencyPrice,
              gbpCurrencyPrice,
            ],
            currencyPricesHistory: {
              Currency.usd: usdCurrencyPrices,
              Currency.gbp: [gbpCurrencyPrice],
              Currency.eur: [
                euroCurrencyPrice.copyWith(
                  timeStamp: gbpCurrencyPrice.timeStamp,
                ),
              ],
            },
            timeStamp: gbpCurrencyPrice.timeStamp,
          ),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/load_success/load_success',
      );
    });

    testGoldens('LoadSuccessWithSomeMissingData', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          BtcState.loadSuccess(
            currencyPrices: [
              usdCurrencyPrices.last,
              euroCurrencyPrices.last,
              gbpCurrencyPrice,
            ],
            currencyPricesHistory: {
              Currency.usd: usdCurrencyPrices,
              Currency.gbp: [gbpCurrencyPrice],
              Currency.eur: euroCurrencyPrices,
            },
            timeStamp: gbpCurrencyPrice.timeStamp,
          ),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(currency: Currency.eur),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/load_success_with_some_missing_data/load_success_with_some_missing_data',
      );
    });

    testGoldens('LoadSuccessWithTwoSimilarPoints', (tester) async {
      whenListen(
        mockBtcBloc,
        Stream<BtcState>.value(
          BtcState.loadSuccess(
            currencyPrices: [
              usdCurrencyPrices.last,
              euroCurrencyPrices.last,
              gbpCurrencyPrices.last,
            ],
            currencyPricesHistory: {
              Currency.usd: usdCurrencyPrices,
              Currency.gbp: gbpCurrencyPrices,
              Currency.eur: euroCurrencyPrices,
            },
            timeStamp: gbpCurrencyPrices.last.timeStamp,
          ),
        ),
        initialState: const BtcState.loading(),
      );

      await tester.pumpWidgetBuilder(
        buildSubject(currency: Currency.gbp),
        wrapper: (widget) =>
            customMaterialAppWrapper(widget, isDarkMode: i == 0),
      );

      await multiScreenGolden(
        tester,
        '${i == 0 ? 'darkTheme' : 'lightTheme'}/load_success_with_two_similar_points/load_success_with_two_similar_points',
      );
    });
  }
}
