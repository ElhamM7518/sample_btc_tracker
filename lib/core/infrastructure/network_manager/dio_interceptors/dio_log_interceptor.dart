import 'package:dio/dio.dart';
import 'package:sample_btc_tracker/core/infrastructure/logger/logger.dart';

class DioLogInterceptor extends Interceptor {
  static final _logger = Log('http');
  late final void Function(Object object) logPrint;

  DioLogInterceptor() {
    logPrint = _logger.i;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('[Request] ${options.method} ${options.uri}');
    logPrint('headers: ${options.headers}');
    logPrint('data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logPrint(
      '[Response] ${response.requestOptions.method} ${response.statusCode} ${response.requestOptions.uri}',
    );
    logPrint('headers: ${response.headers.map}');
    logPrint('response: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '[HttpError] ${err.requestOptions.method} '
      '${err.response?.statusCode ?? ' '}'
      '${err.response?.statusMessage != null ? ' ${err.response!.statusMessage}' : ' '}'
      ' ${err.requestOptions.uri}',
      err,
      err.stackTrace,
    );
    if (err.response?.data != null && err.response!.data is! String) {
      _logger.e('response: ${err.response!.data}');
    }

    handler.next(err);
  }
}
