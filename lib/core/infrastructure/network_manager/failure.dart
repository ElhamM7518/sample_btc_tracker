import 'package:meta/meta.dart';

/// Base class for failures
abstract class Failure {}

typedef NetworkFailureCallback<T> = T Function();
typedef UnknownServerFailureCallback<T> = T Function();
typedef ServerFailureCallback<T, F> = T Function(int code, F failure);

@immutable
abstract class FailureWrapper<F> {
  const FailureWrapper();
  const factory FailureWrapper.networkFailure() = _NetworkFailure<F>;
  const factory FailureWrapper.unknownServerFailure() =
      _UnknownServerFailure<F>;
  const factory FailureWrapper.serverFailure(int code, F failure) =
      _ServerFailure<F>;

  R fold<R>({
    required NetworkFailureCallback<R> networkFailure,
    required UnknownServerFailureCallback<R> unknownServerFailure,
    required ServerFailureCallback<R, F> serverFailure,
  });
}

@immutable
class _NetworkFailure<F> extends FailureWrapper<F> {
  const _NetworkFailure();

  @override
  R fold<R>({
    required NetworkFailureCallback<R> networkFailure,
    required UnknownServerFailureCallback<R> unknownServerFailure,
    required ServerFailureCallback<R, F> serverFailure,
  }) {
    return networkFailure();
  }

  @override
  String toString() => '_NetworkFailure<$F>()';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is _NetworkFailure<F>;
  }

  @override
  int get hashCode => 0;
}

@immutable
class _UnknownServerFailure<F> extends FailureWrapper<F> {
  const _UnknownServerFailure();

  @override
  R fold<R>({
    required NetworkFailureCallback<R> networkFailure,
    required UnknownServerFailureCallback<R> unknownServerFailure,
    required ServerFailureCallback<R, F> serverFailure,
  }) {
    return unknownServerFailure();
  }

  @override
  String toString() => '_UnknownServerFailure<$F>()';

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is _UnknownServerFailure<F>;
  }

  @override
  int get hashCode => 0;
}

@immutable
class _ServerFailure<F> extends FailureWrapper<F> {
  final int code;
  final F failure;

  const _ServerFailure(this.code, this.failure);

  @override
  R fold<R>({
    required NetworkFailureCallback<R> networkFailure,
    required UnknownServerFailureCallback<R> unknownServerFailure,
    required ServerFailureCallback<R, F> serverFailure,
  }) {
    return serverFailure(code, failure);
  }

  @override
  String toString() => '_ServerFailure<$F>(code: $code, failure: $failure)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _ServerFailure<F> &&
            code == other.code &&
            failure == other.failure;
  }

  @override
  int get hashCode => failure.hashCode;
}

/// This is meant to be used when the [_ServerFailure] just has a message to be
/// shown.
typedef CommonFailure = FailureWrapper<String>;
