import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:sample_btc_tracker/core/infrastructure/logger/log/log.dart';

class CustomPrinter extends LogPrinter {
  static const levelPrefixes = {
    Level.trace: '[VERBOSE]',
    Level.debug: '[DEBUG]',
    Level.info: '[INFO]',
    Level.warning: '[WARNING]',
    Level.error: '[ERROR]',
    Level.fatal: '[WTF]',
  };

  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.none(),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  final String name;
  final bool printTime;
  final bool colors;
  final LogServiceCallback sendToLogService;

  CustomPrinter(
    this.name, {
    this.printTime = false,
    this.colors = true,
    this.sendToLogService,
  });

  @override
  List<String> log(LogEvent event) {
    sendToLogService?.call(
      LogLevel.values.byName(event.level.name),
      event.message.toString(),
      event.error.toString(),
      event.stackTrace,
    );

    final error = StringBuffer();

    if (event.error != null) {
      if (colors) {
        final errorLines = event.error.toString().split('\n');

        for (var index = 0; index < errorLines.length; index++) {
          errorLines[index] = _colorize(errorLines[index], event.level);
        }
        error.writeAll(errorLines);
      } else {
        error.write(event.stackTrace.toString());
      }
    }

    final stackTrace = StringBuffer();

    if (event.stackTrace != null) {
      if (colors) {
        final stackTraceLines = event.stackTrace.toString().split('\n');

        stackTrace.writeln(_colorize('STACKTRACE:', event.level));

        for (var index = 0; index < stackTraceLines.length; index++) {
          stackTraceLines[index] = _colorize(
            stackTraceLines[index],
            event.level,
          );
        }
        stackTrace.writeAll(stackTraceLines, '\n');
      } else {
        stackTrace
          ..writeln('STACKTRACE:')
          ..write(event.stackTrace.toString());
      }
    }

    return <String>[
          _stringifyMessage(event.message, event.level),
          if (event.error != null) error.toString(),
          if (event.stackTrace != null) stackTrace.toString(),
        ]
        .map(
          (e) => '${_dateTime()} ${_name(name)} ${_labelFor(event.level)} $e',
        )
        .toList();
  }

  String _dateTime() {
    if (!printTime) {
      return '';
    }
    final dateTime = DateTime.now().toUtc().toIso8601String();
    return colors ? AnsiColor.fg(AnsiColor.grey(0.6))(dateTime) : dateTime;
  }

  String _name(String name) {
    return colors ? AnsiColor.fg(AnsiColor.grey(0.6))(name) : name;
  }

  String _labelFor(Level level) {
    final prefix = levelPrefixes[level]!;

    return _colorize(prefix, level);
  }

  String _stringifyMessage(dynamic message, Level level) {
    if (message is Map || message is Iterable) {
      const encoder = JsonEncoder.withIndent(null);
      return _colorize(encoder.convert(message), level);
    }

    return _colorize(message.toString(), level);
  }

  String _colorize(String message, Level level) {
    final color = levelColors[level]!;

    return colors ? color(message) : message;
  }
}
