import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sample_btc_tracker/core/infrastructure/logger/log/custom_printer.dart';
import 'package:sample_btc_tracker/core/infrastructure/logger/log/file_output.dart'
    as file_output;
import 'package:sample_btc_tracker/core/infrastructure/logger/log/log_internal_info.dart';

enum LogLevel {
  verbose,
  trace,
  debug,
  info,
  warning,
  error,
  wtf,
  fatal,
  nothing,
  off,
}

typedef LogServiceCallback =
    void Function(
      LogLevel level,
      String message,
      String error,
      StackTrace? stackTrace,
    )?;

/// Prints messages with the following structure:
///
/// ```name [LEVEL] message```
class Log {
  static late bool _isMobileWeb;
  static late Level _level;
  static late LogServiceCallback _sendToLogService;

  static Level _logLevelToLevel(LogLevel level) =>
      Level.values.byName(level.name);

  static Future<void> initialize({
    /// Whether the platform is web, and the device is Android or iOS
    required bool isMobileWeb,
    required LogLevel logLevel,
    required LogServiceCallback sendToLogService,
  }) async {
    await LogInternalInfo.setLogInternalInfo();
    _isMobileWeb = isMobileWeb;
    _level = _logLevelToLevel(logLevel);
    _sendToLogService = sendToLogService;
    LogInternalInfo.memoryOutput = !_isMobileWeb
        ? null
        : MemoryOutput(bufferSize: 200000, secondOutput: ConsoleOutput());
  }

  static final appLogger = Log('app');

  static final _fileOutput = file_output.FileOutput(
    filePath: '${LogInternalInfo.logFilePath}/${LogInternalInfo.logFileName}',
  );

  static final _fileOutputWithConsole = kIsWeb
      ? null
      : MultiOutput([_fileOutput, ConsoleOutput()]);

  static Future<void> clearLogFile() async {
    if (kIsWeb) {
      return;
    }

    await _fileOutput.clear();
  }

  final Logger _logger;

  Log(String name)
    : _logger = Logger(
        level: _level,
        printer: CustomPrinter(
          name,
          printTime: true,
          // Ignoring since it shows a false lint since the value is not static
          // ignore: avoid_redundant_argument_values
          colors: kDebugMode && !(!kIsWeb && Platform.isIOS),
          sendToLogService: _sendToLogService,
        ),
        output: _isMobileWeb
            ? LogInternalInfo.memoryOutput
            : LogInternalInfo.logFilePath != null
            ? _fileOutputWithConsole
            : ConsoleOutput(),
        filter: ProductionFilter(),
      );

  /// Log a message at level [Level.trace].
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.trace, message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.debug, message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.info, message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.warning, message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.error, message, error, stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log(Level.fatal, message, error, stackTrace);
  }

  void log(
    Level level,
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    if (level.index < _level.index) return;
    _logger.log(level, message, error: error, stackTrace: stackTrace);
  }
}
