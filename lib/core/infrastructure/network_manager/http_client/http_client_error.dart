import 'package:meta/meta.dart';
import 'package:sample_btc_tracker/core/domain/failure.dart';

typedef NetworkErrorCallback<T> = T Function();
typedef UnknownServerErrorCallback<T> = T Function();
typedef ServerErrorCallback<T> = T Function(int statusCode, String exception);

@immutable
abstract class HttpClientError {
  const HttpClientError();

  const factory HttpClientError.networkError() = _NetworkError;
  const factory HttpClientError.serverError(int statusCode, String exception) =
      _ServerError;
  const factory HttpClientError.unknownServerError() = _UnknownServerError;

  R fold<R>({
    required NetworkErrorCallback<R> networkError,
    required UnknownServerErrorCallback<R> unknownServerError,
    required ServerErrorCallback<R> serverError,
  });
}

@immutable
class _NetworkError extends HttpClientError {
  const _NetworkError();

  @override
  R fold<R>({
    required NetworkErrorCallback<R> networkError,
    required UnknownServerErrorCallback<R> unknownServerError,
    required ServerErrorCallback<R> serverError,
  }) {
    return networkError();
  }

  @override
  String toString() => '_NetworkError()';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is _NetworkError;
  }

  @override
  int get hashCode => 0;
}

@immutable
class _UnknownServerError extends HttpClientError {
  const _UnknownServerError();

  @override
  R fold<R>({
    required NetworkErrorCallback<R> networkError,
    required ServerErrorCallback<R> serverError,
    required UnknownServerErrorCallback<R> unknownServerError,
  }) {
    return unknownServerError();
  }

  @override
  String toString() => '_UnknownServerError()';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is _UnknownServerError;
  }

  @override
  int get hashCode => 0;
}

@immutable
class _ServerError extends HttpClientError {
  final int statusCode;
  final String exception;

  const _ServerError(this.statusCode, this.exception);

  @override
  R fold<R>({
    required NetworkErrorCallback<R> networkError,
    required UnknownServerErrorCallback<R> unknownServerError,
    required ServerErrorCallback<R> serverError,
  }) {
    return serverError(statusCode, exception);
  }

  @override
  String toString() =>
      '_ServerError(exception: $exception, statusCode: $statusCode)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _ServerError &&
            statusCode == other.statusCode &&
            exception == other.exception;
  }

  @override
  int get hashCode => exception.hashCode;
}

extension HttpClientErrorX on HttpClientError {
  CommonFailure toCommonFailure() {
    return fold(
      networkError: () => const CommonFailure.networkFailure(),
      unknownServerError: () => const CommonFailure.unknownServerFailure(),
      serverError: CommonFailure.serverFailure,
    );
  }
}
