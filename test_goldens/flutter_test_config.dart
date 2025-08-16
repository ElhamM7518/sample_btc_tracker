import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final fontManifest = await rootBundle
          .loadStructuredData<Iterable<Map<String, dynamic>>>(
            'FontManifest.json',
            (string) async => (json.decode(string) as List<dynamic>)
                .cast<Map<String, dynamic>>(),
          );

      for (final font in fontManifest) {
        final fontLoader = FontLoader(font['family'] as String);
        for (final fontType
            in (font['fonts'] as List<dynamic>).cast<Map<String, dynamic>>()) {
          fontLoader.addFont(rootBundle.load(fontType['asset'] as String));
        }
        await fontLoader.load();
      }
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      enableRealShadows: true,
      defaultDevices: const [
        Device(name: 'phone_mini', size: Size(360, 640), devicePixelRatio: 3),
        Device(
          name: 'iphone14',
          size: Size(430, 932),
          devicePixelRatio: 3,
          safeArea: EdgeInsets.only(top: 59, bottom: 34),
        ),
        Device(
          name: 'ipad_mini',
          size: Size(768, 1024),
          devicePixelRatio: 2,
          safeArea: EdgeInsets.only(top: 24, bottom: 20),
        ),
        Device(
          name: 'surface_pro',
          size: Size(1280, 720),
          devicePixelRatio: 1.5,
        ),
      ],
    ),
  );
}
