import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/btc.dart';
import 'package:test/test.dart';

import '../../../test_extensions.dart';
import 'btc_bloc_test.mocks.dart';

// NOTE: To run the tests, you need to set "Environment == test"
// Use dart-defines to set the Environment => --dart-define=ENVIRONMENT=test

@GenerateNiceMocks([MockSpec<BtcRepository>()])
void main() {
  group('BtcBloc', () {
    final mockBtcRepository = MockBtcRepository();
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

    BtcBloc bloc() => BtcBloc(mockBtcRepository);

    blocTest<BtcBloc, BtcState>(
      'emits [] when [loaded] added on Loading state',
      build: bloc,
      seed: () => const BtcState.loading(),
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => <BtcState>[],
    );

    blocTest<BtcBloc, BtcState>(
      'emits [loadFailure] when [loaded] added and fetchBtcCurrency(Eur) failed on Initial state',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async => left(const CommonFailure.networkFailure()),
        );
      },
      build: bloc,
      seed: () => const BtcState.initial(),
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
        const BtcState.loading(),
        const BtcState.loadFailure(FailureWrapper.networkFailure()),
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadFailure] when [loaded] added and fetchBtcCurrency(Gbp) failed on NetworkFailure state.',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async =>
              right([usdCurrencyPrice, euroCurrencyPrice]),
        );
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.gbp),
        ).thenAnswer(
          (realInvocation) async =>
              left(const CommonFailure.unknownServerFailure()),
        );
      },
      build: bloc,
      seed: () => const BtcState.loadFailure(FailureWrapper.networkFailure()),
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
        const BtcState.loading(),
        const BtcState.loadFailure(FailureWrapper.unknownServerFailure()),
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadSuccess] when [loaded] added on Initial state.',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async =>
              right([usdCurrencyPrice, euroCurrencyPrice]),
        );
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.gbp),
        ).thenAnswer(
          (realInvocation) async => right([usdCurrencyPrice, gbpCurrencyPrice]),
        );
      },
      build: bloc,
      seed: () => const BtcState.initial(),
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
        const BtcState.loading(),
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
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadSuccess(failedToRefresh)] when [loaded] added on LoadSuccess state and fetchBtcCurrency(Eur) failed.',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async => left(const FailureWrapper.networkFailure()),
        );
      },
      build: bloc,
      seed: () => BtcState.loadSuccess(
        currencyPrices: [usdCurrencyPrice, euroCurrencyPrice, gbpCurrencyPrice],
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
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
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
          isRefreshing: true,
        ),
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
          failedToRefresh: const FailureWrapper.networkFailure(),
        ),
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
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadSuccess(failedToRefresh)] when [loaded] added on LoadSuccess state and fetchBtcCurrency(Gbp) failed.',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async =>
              right([usdCurrencyPrice, euroCurrencyPrice]),
        );
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.gbp),
        ).thenAnswer(
          (realInvocation) async =>
              left(const FailureWrapper.serverFailure(400, 'failure')),
        );
      },
      build: bloc,
      seed: () => BtcState.loadSuccess(
        currencyPrices: [usdCurrencyPrice, euroCurrencyPrice, gbpCurrencyPrice],
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
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
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
          isRefreshing: true,
        ),
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
          failedToRefresh: const FailureWrapper.serverFailure(400, 'failure'),
        ),
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
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadSuccess] when [loaded] added on LoadSuccess state (Refresh Prices scenario).',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswer(
          (realInvocation) async => right([
            usdCurrencyPrice.copyWith(
              price: 117491,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
            euroCurrencyPrice.copyWith(
              price: 111474.513,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
          ]),
        );
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.gbp),
        ).thenAnswer(
          (realInvocation) async => right([
            usdCurrencyPrice.copyWith(
              price: 117491,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
            ),
            gbpCurrencyPrice.copyWith(
              price: 96190.9385000002,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
            ),
          ]),
        );
      },
      build: bloc,
      seed: () => BtcState.loadSuccess(
        currencyPrices: [usdCurrencyPrice, euroCurrencyPrice, gbpCurrencyPrice],
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
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
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
          isRefreshing: true,
        ),
        BtcState.loadSuccess(
          currencyPrices: [
            usdCurrencyPrice.copyWith(
              price: 117491,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
            euroCurrencyPrice.copyWith(
              price: 111474.513,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
            gbpCurrencyPrice.copyWith(
              price: 96190.9385000002,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
            ),
          ],
          currencyPricesHistory: {
            Currency.usd: [
              usdCurrencyPrice.copyWith(
                timeStamp: DateTime.parse('2025-08-16T08:00:01.000Z'),
              ),
              usdCurrencyPrice.copyWith(
                price: 117491,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
            Currency.gbp: [
              gbpCurrencyPrice,
              gbpCurrencyPrice.copyWith(
                price: 96190.9385000002,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
            Currency.eur: [
              euroCurrencyPrice.copyWith(
                timeStamp: DateTime.parse('2025-08-16T08:00:01.000Z'),
              ),
              euroCurrencyPrice.copyWith(
                price: 111474.513,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
          },
          timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
        ),
      ],
    );
    blocTest<BtcBloc, BtcState>(
      'emits [loadSuccess] when [loaded] added on LoadSuccess state (Refresh Prices scenario after 5 milliseconds).',
      setUp: () {
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.eur),
        ).thenAnswerInOrder([
          Future.value(right([usdCurrencyPrice, euroCurrencyPrice])),
          Future.value(
            right([
              usdCurrencyPrice.copyWith(
                price: 117491,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
              ),
              euroCurrencyPrice.copyWith(
                price: 111474.513,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
              ),
            ]),
          ),
        ]);
        when(
          mockBtcRepository.fetchBtcCurrency(currency: Currency.gbp),
        ).thenAnswerInOrder([
          Future.value(right([usdCurrencyPrice, gbpCurrencyPrice])),
          Future.value(
            right([
              usdCurrencyPrice.copyWith(
                price: 117491,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
              ),
              gbpCurrencyPrice.copyWith(
                price: 96190.9385000002,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ]),
          ),
        ]);
      },
      build: bloc,
      wait: const Duration(milliseconds: 8),
      seed: () => const BtcState.initial(),
      act: (bloc) => bloc.add(const BtcEvent.loaded()),
      expect: () => [
        const BtcState.loading(),
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
          isRefreshing: true,
        ),
        BtcState.loadSuccess(
          currencyPrices: [
            usdCurrencyPrice.copyWith(
              price: 117491,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
            euroCurrencyPrice.copyWith(
              price: 111474.513,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.005Z'),
            ),
            gbpCurrencyPrice.copyWith(
              price: 96190.9385000002,
              timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
            ),
          ],
          currencyPricesHistory: {
            Currency.usd: [
              usdCurrencyPrice.copyWith(
                timeStamp: DateTime.parse('2025-08-16T08:00:01.000Z'),
              ),
              usdCurrencyPrice.copyWith(
                price: 117491,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
            Currency.gbp: [
              gbpCurrencyPrice,
              gbpCurrencyPrice.copyWith(
                price: 96190.9385000002,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
            Currency.eur: [
              euroCurrencyPrice.copyWith(
                timeStamp: DateTime.parse('2025-08-16T08:00:01.000Z'),
              ),
              euroCurrencyPrice.copyWith(
                price: 111474.513,
                timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
              ),
            ],
          },
          timeStamp: DateTime.parse('2025-08-16T08:00:01.006Z'),
        ),
      ],
    );
  });
}
