import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/gen/language/translations/app_localizations.dart';

extension BuildContextX on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  bool get isDesktopView => MediaQuery.sizeOf(this).width > 700;
  double get height => MediaQuery.sizeOf(this).height;
  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextStyle get defaultTextStyle => DefaultTextStyle.of(this).style;
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppLocalizations get l10n => AppLocalizations.of(this);
}
