import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';
import 'package:sample_btc_tracker/features/converter/converter.dart';

import '../../../material_app_wrapper.dart';

class MockBtcBloc extends MockBloc<BtcEvent, BtcState> implements BtcBloc {}

class MockConverterBloc extends MockBloc<ConverterEvent, ConverterState>
    implements ConverterBloc {}

void main() {
  late MockBtcBloc mockBtcBloc;
  late MockConverterBloc mockConverterBloc;
  final usdCurrencyPrice = CurrencyPriceEntity(
    currency: Currency.usd,
    price: 117490,
    timeStamp: DateTime.parse('2025-08-16T08:00:00.000Z'),
  );
  final euroCurrencyPrice = CurrencyPriceEntity(
    currency: Currency.eur,
    price: 111474.512,
    timeStamp: DateTime.parse('2025-08-16T08:00:03.000Z'),
  );
  final gbpCurrencyPrice = CurrencyPriceEntity(
    currency: Currency.gbp,
    price: 96190.9385000001,
    timeStamp: DateTime.parse('2025-08-16T08:00:03.000Z'),
  );

  setUp(() {
    mockBtcBloc = MockBtcBloc();
    mockConverterBloc = MockConverterBloc();
    whenListen(
      mockBtcBloc,
      Stream<BtcState>.value(
        BtcState.loadSuccess(
          currencyPrices: [
            usdCurrencyPrice,
            euroCurrencyPrice,
            gbpCurrencyPrice,
          ],
          currencyPricesHistory: {
            Currency.usd: [
              usdCurrencyPrice.copyWith(timeStamp: gbpCurrencyPrice.timeStamp),
            ],
            Currency.gbp: [gbpCurrencyPrice],
            Currency.eur: [
              euroCurrencyPrice.copyWith(timeStamp: gbpCurrencyPrice.timeStamp),
            ],
          },
          timeStamp: gbpCurrencyPrice.timeStamp,
        ),
      ),
      initialState: const BtcState.loading(),
    );
    whenListen(
      mockConverterBloc,
      const Stream<ConverterState>.empty(),
      initialState: ConverterState(
        currencyAmount: usdCurrencyPrice.price,
        btcAmount: 1,
        selectedCurrency: Currency.usd,
        currencyToBtc: true,
      ),
    );
  });

  Widget buildSubject() => MultiBlocProvider(
    providers: [
      BlocProvider<BtcBloc>.value(value: mockBtcBloc),
      BlocProvider<ConverterBloc>.value(value: mockConverterBloc),
    ],
    child: const ConverterView(),
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

    group('LoadSuccess Scenarios', () {
      testGoldens('LoadSuccess', (tester) async {
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
      testGoldens('CurrencyAmountChanged', (tester) async {
        whenListen(
          mockConverterBloc,
          Stream<ConverterState>.value(
            const ConverterState(
              currencyAmount: 11749,
              btcAmount: 0.1,
              selectedCurrency: Currency.usd,
              currencyToBtc: true,
            ),
          ),
          initialState: ConverterState(
            currencyAmount: 117490,
            btcAmount: usdCurrencyPrice.price,
            selectedCurrency: Currency.usd,
            currencyToBtc: true,
          ),
        );
        await tester.pumpWidgetBuilder(
          buildSubject(),
          wrapper: (widget) =>
              customMaterialAppWrapper(widget, isDarkMode: i == 0),
        );

        await multiScreenGolden(
          tester,
          '${i == 0 ? 'darkTheme' : 'lightTheme'}/currency_amount_changed/currency_amount_changed',
          customPump: (tester) async {
            await tester.enterText(
              find.byKey(ConverterKeys.currencyTextFormFieldKey),
              '11749',
            );
            await tester.pumpAndSettle();
          },
        );
      });
      testGoldens('BtcAmountChanged', (tester) async {
        whenListen(
          mockConverterBloc,
          Stream<ConverterState>.value(
            const ConverterState(
              currencyAmount: 12639,
              btcAmount: 1.1,
              selectedCurrency: Currency.usd,
              currencyToBtc: false,
            ),
          ),
          initialState: const ConverterState(
            currencyAmount: 117490,
            btcAmount: 1,
            selectedCurrency: Currency.usd,
            currencyToBtc: false,
          ),
        );
        await tester.pumpWidgetBuilder(
          buildSubject(),
          wrapper: (widget) =>
              customMaterialAppWrapper(widget, isDarkMode: i == 0),
        );

        await multiScreenGolden(
          tester,
          '${i == 0 ? 'darkTheme' : 'lightTheme'}/btc_amount_changed/btc_amount_changed',
          customPump: (tester) async {
            await tester.enterText(
              find.byKey(ConverterKeys.btcTextFormFieldKey),
              '1.1',
            );
            await tester.pumpAndSettle();
          },
        );
      });
      for (final device in GoldenToolkit.configuration.defaultDevices) {
        testGoldens('CurrenciesPopupMenuOpened', (tester) async {
          whenListen(
            mockConverterBloc,
            Stream<ConverterState>.value(
              const ConverterState(
                currencyAmount: 12639,
                btcAmount: 1.1,
                selectedCurrency: Currency.usd,
                currencyToBtc: false,
              ),
            ),
            initialState: const ConverterState(
              currencyAmount: 117490,
              btcAmount: 1,
              selectedCurrency: Currency.usd,
              currencyToBtc: false,
            ),
          );
          await tester.pumpWidgetBuilder(
            buildSubject(),
            wrapper: (widget) =>
                customMaterialAppWrapper(widget, isDarkMode: i == 0),
            surfaceSize: device.size,
          );

          await tester.tap(find.byKey(ConverterKeys.currenciesPopupMenuKey));
          await tester.pumpAndSettle();

          await multiScreenGolden(
            tester,
            '${i == 0 ? 'darkTheme' : 'lightTheme'}/currencies_popup_menu_opened/currencies_popup_menu_opened',
            devices: [device],
          );
        });
      }
    });
  }
}
