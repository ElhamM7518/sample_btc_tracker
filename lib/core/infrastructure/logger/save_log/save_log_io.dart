import 'dart:io';
import 'package:sample_btc_tracker/core/infrastructure/logger/log/log_internal_info.dart';
import 'package:share_plus/share_plus.dart';

Future<void> saveLog() async {
  final logFileName = DateTime.now().toIso8601String().replaceAll(':', '_');
  final logFilePath = '${LogInternalInfo.logFilePath}/$logFileName.log';
  final file = await File(
    '${LogInternalInfo.logFilePath}/${LogInternalInfo.logFileName}',
  ).create();
  await XFile(file.path).saveTo(logFilePath);

  await Share.shareXFiles([XFile(logFilePath)]);
}
