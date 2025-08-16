import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:sample_btc_tracker/core/data/json.dart';
import 'package:sample_btc_tracker/core/infrastructure/network_manager/http_client/http_client_error.dart';

typedef HttpClientResponse = Either<HttpClientError, Object?>;
typedef ProgressCallback = void Function(int count, int total);

class HttpClient {
  final Dio _dioClient;

  const HttpClient(this._dioClient);

  Future<HttpClientResponse> _performRequest({
    required String method,
    required String path,
    Json? headers,
    Object? body,
    Json? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    FormData? formData,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    try {
      final result = await _dioClient.request<Object?>(
        path,
        data: body ?? formData,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
        ),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken?._cancelToken,
      );

      if (result.statusCode == 200) {
        if (result.data != null && result.data is Json) {
          final parseRes = result.data! as Json;
          return right(parseRes);
        } else {
          return left(const HttpClientError.unknownServerError());
        }
      } else {
        return left(const HttpClientError.unknownServerError());
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.badCertificate:
        case DioExceptionType.cancel:
        case DioExceptionType.unknown:
          return left(const HttpClientError.networkError());

        case DioExceptionType.badResponse:
          return left(const HttpClientError.unknownServerError());
      }
    }
  }

  Future<HttpClientResponse> get(
    String path, {
    Json? queryParameters,
    Json? headers,
    CancelToken? cancelToken,
  }) {
    return _performRequest(
      method: 'GET',
      path: path,
      headers: headers,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<HttpClientResponse> post(
    String path, {
    Json? headers,
    Object? body,
    Json? queryParameters,
    CancelToken? cancelToken,
  }) {
    return _performRequest(
      method: 'POST',
      path: path,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<HttpClientResponse> put(
    String path, {
    Json? headers,
    Object? body,
    Json? queryParameters,
    CancelToken? cancelToken,
  }) {
    return _performRequest(
      method: 'PUT',
      path: path,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<HttpClientResponse> patch(
    String path, {
    Json? headers,
    Object? body,
    Json? queryParameters,
    CancelToken? cancelToken,
  }) {
    return _performRequest(
      method: 'PATCH',
      path: path,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<HttpClientResponse> delete(
    String path, {
    Json? headers,
    Object? body,
    Json? queryParameters,
    CancelToken? cancelToken,
  }) {
    return _performRequest(
      method: 'DELETE',
      path: path,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<HttpClientResponse> uploadFormData({
    required String path,
    required List<int> imageBytes,
    required String keyName,
    String? imageFileName,
    Json? headers,
    List<MapEntry<String, String>>? body,
    Json? queryParameters,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final formData = FormData();
    if (body != null) {
      formData.fields.addAll(body);
    }
    formData.files.add(
      MapEntry(
        keyName,
        MultipartFile.fromBytes(imageBytes, filename: imageFileName),
      ),
    );

    return _performRequest(
      method: 'POST',
      path: path,
      headers: headers,
      formData: formData,
      queryParameters: queryParameters,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
  }
}

class CancelToken {
  final _cancelToken = dio.CancelToken();

  /// whether cancelled
  bool get isCancelled => _cancelToken.isCancelled;

  /// When cancelled, this future will be resolved.
  Future<DioException> get whenCancel => _cancelToken.whenCancel;

  /// Cancel the request
  void cancel([dynamic reason]) => _cancelToken.cancel(reason);
}
