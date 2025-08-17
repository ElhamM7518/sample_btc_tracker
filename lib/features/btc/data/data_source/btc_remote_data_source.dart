import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_btc_tracker/core/data/json.dart';
import 'package:sample_btc_tracker/core/data/remote_data_source.dart';
import 'package:sample_btc_tracker/core/infrastructure/network_manager/http_client/http_client_error.dart';
import 'package:sample_btc_tracker/features/btc/data/models/models.dart';

@lazySingleton
class BtcRemoteDataSource extends RemoteDataSource {
  BtcRemoteDataSource(super.httpClient);

  Future<Either<HttpClientError, CryptoResponseModel>> fetchBtcCurrency({
    required String currency,
  }) async {
    final res = await httpClient.get(
      '/v2/ticker/bitcoin/',
      queryParameters: {'convert': currency},
    );
    return res.fold(
      left,
      (res) => right(CryptoResponseModel.fromJson(res! as Json)),
    );
  }
}
