import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/gen/language/translations/app_localizations.dart';

Widget customMaterialAppWrapper(Widget widget, {bool isDarkMode = true}) {
  return Builder(
    builder: (context) {
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) => context.l10n.appTitle,
        themeMode: ThemeMode.light,
        theme: isDarkMode
            ? AppTheme.darkTheme(context)
            : AppTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        home: Material(child: AppContentBox(child: widget)),
      );
    },
  );
}
