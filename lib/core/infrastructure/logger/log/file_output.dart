import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

/// Writes the log output to a file.
class FileOutput extends LogOutput {
  final String filePath;
  final File _file;
  final bool overrideExisting;
  final Encoding encoding;
  final _outputEventsStreamController = StreamController<OutputEvent>();
  IOSink? _sink;
  bool _isInitialized = false;
  bool _isClearingLogFile = false;

  FileOutput({
    required this.filePath,
    this.overrideExisting = false,
    this.encoding = utf8,
  }) : _file = File(filePath);

  void _setSink() {
    _sink = _file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  Future<void> init() async {
    if (_isInitialized) {
      return;
    }

    _isInitialized = true;

    _setSink();

    await for (final event in _outputEventsStreamController.stream) {
      _sink
        ?..writeAll(event.lines, '\n')
        ..writeln();
    }
  }

  @override
  void output(OutputEvent event) {
    _outputEventsStreamController.add(event);
  }

  Future<void> clear() async {
    if (_isClearingLogFile) {
      return;
    }

    _isClearingLogFile = true;

    await _sink?.close();
    _file.deleteSync();
    _setSink();

    _isClearingLogFile = false;
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
    await _outputEventsStreamController.close();
  }
}
