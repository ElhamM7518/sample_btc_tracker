import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/data/data_source/btc_remote_data_source.dart';
import 'package:sample_btc_tracker/features/btc/domain/domain.dart';

@LazySingleton(as: BtcRepository)
class BtcRepositoryImpl implements BtcRepository {
  final BtcRemoteDataSource _remoteDataSource;

  BtcRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<CommonFailure, List<CurrencyPriceEntity>>> fetchBtcCurrency({
    required Currency currency,
  }) async {
    final currencyString = currency.name.toUpperCase();
    final result = await _remoteDataSource.fetchBtcCurrency(
      currency: currencyString,
    );
    return result.fold((l) => left(l.toCommonFailure()), (data) {
      if (data.data.containsKey('1') &&
          data.data['1']!.quotes.containsKey(currencyString) &&
          data.data['1']!.quotes[currencyString] != null) {
        final timeStamp = DateTime.timestamp();
        return right([
          CurrencyPriceEntity(
            currency: Currency.usd,
            price:
                data.data['1']!.quotes[Currency.usd.name.toUpperCase()]!.price,
            timeStamp: timeStamp,
          ),
          CurrencyPriceEntity(
            currency: currency,
            price: data.data['1']!.quotes[currencyString]!.price,
            timeStamp: timeStamp,
          ),
        ]);
      }
      return left(const CommonFailure.serverFailure(400, 'Invalid response!'));
    });
  }
}
