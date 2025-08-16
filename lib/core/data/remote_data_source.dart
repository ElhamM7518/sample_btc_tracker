import 'package:meta/meta.dart';
import 'package:sample_btc_tracker/core/infrastructure/network_manager/http_client/http_client.dart';

abstract class RemoteDataSource {
  const RemoteDataSource(this.httpClient);

  @protected
  final HttpClient httpClient;
}
