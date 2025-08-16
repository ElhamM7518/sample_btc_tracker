import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LogInternalInfo {
  static String? logFilePath;
  static const logFileName = 'app_log.log';
  static MemoryOutput? memoryOutput;

  const LogInternalInfo._();

  static Future<void> setLogInternalInfo() async {
    try {
      if (!kIsWeb) logFilePath = (await getTemporaryDirectory()).path;
    } catch (e) {
      // Nothing needs to be handled in this case!
    }
  }
}
