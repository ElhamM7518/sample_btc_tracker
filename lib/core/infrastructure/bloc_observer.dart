import 'package:bloc/bloc.dart';
import 'package:sample_btc_tracker/core/infrastructure/logger/logger.dart';

final _blocLogger = Log('bloc');

enum _BlocObserverType {
  onCreate,
  onEvent,
  onTransition,
  onChange,
  onError,
  onClose,
}

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _blocLogger.i(_formatMessage(bloc: bloc, type: _BlocObserverType.onCreate));
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _blocLogger.i(
      _formatMessage(
        bloc: bloc,
        type: _BlocObserverType.onEvent,
        message: 'event: $event',
      ),
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _blocLogger.i(
      _formatMessage(
        bloc: bloc,
        type: _BlocObserverType.onTransition,
        message:
            'event: ${transition.event}\ncurrentState: ${transition.currentState}\nnextState: ${transition.nextState}',
      ),
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      _blocLogger.i(
        _formatMessage(
          bloc: bloc,
          type: _BlocObserverType.onChange,
          message: change.toString(),
        ),
      );
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _blocLogger.e(
      _formatMessage(bloc: bloc, type: _BlocObserverType.onError),
      error,
      stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _blocLogger.i(_formatMessage(bloc: bloc, type: _BlocObserverType.onClose));
  }

  String _formatMessage({
    required BlocBase<dynamic> bloc,
    required _BlocObserverType type,
    String? message,
  }) {
    final buffer = StringBuffer()..write('${bloc.runtimeType} [${type.name}]');
    if (message != null) {
      buffer
        ..writeln()
        ..write(message);
    }

    return buffer.toString();
  }
}
