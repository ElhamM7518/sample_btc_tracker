// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Sample BTC Tracker';

  @override
  String get failedToLoadDataErrorMessage => 'Failed to Load Data';

  @override
  String get tryAgainButtonTitle => 'Try Again';

  @override
  String get bitcoin => 'Bitcoin';

  @override
  String get converter => 'Converter';

  @override
  String get latestUpdate => 'Latest update';

  @override
  String get networkError =>
      'Network Error! Please check your internet connection.';

  @override
  String get unknownError => 'Unknown Error! Please try again later.';

  @override
  String get serverError => 'Server Error!';

  @override
  String get btc => 'BTC';

  @override
  String get convert => 'Convert';
}
