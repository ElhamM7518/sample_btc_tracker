import 'package:dartz/dartz.dart';
import 'package:sample_btc_tracker/core/domain/failure.dart';
import 'package:sample_btc_tracker/features/btc/domain/currency_enum.dart';
import 'package:sample_btc_tracker/features/btc/domain/entities/currency_price_entity.dart';

abstract interface class BtcRepository {
  Future<Either<CommonFailure, List<CurrencyPriceEntity>>> fetchBtcCurrency({
    required Currency currency,
  });
}
