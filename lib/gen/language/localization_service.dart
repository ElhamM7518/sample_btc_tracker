import 'package:flutter/material.dart';

class LocalizationService {
  /// A global key used to access the [NavigatorState] anywhere in the app, primarily
  /// for localization purposes.
  ///
  /// This key allows you to obtain the [BuildContext] associated with the navigator,
  /// which is essential for reading localized strings according to the user's selected
  /// or default language.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// String localizedText = AppLocalizations.of(l10nNavigatorKey.currentContext!)?.someText ?? '';
  /// ```
  ///
  /// By using this key, you can access the current context of the navigator from any part
  /// of your app, enabling the retrieval of localized text even outside of the widget tree.
  final GlobalKey<NavigatorState> l10nNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context => l10nNavigatorKey.currentContext!;
}
