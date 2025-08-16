import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/core/di/service_locator_config.dart';
import 'package:sample_btc_tracker/core/presentation/router/router.dart';
import 'package:sample_btc_tracker/gen/language/translations/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // For better paths on the web
  usePathUrlStrategy();
  // Logger initialization
  await Log.initialize(
    isMobileWeb: false,
    logLevel: LogLevel.values.byName(EnvironmentVariables.logLevel),
    sendToLogService: (level, message, error, stackTrace) {},
  );
  // Initialize GetTt as the main dependency injection handler
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp.router(
    routerConfig: router,
    debugShowCheckedModeBanner: false,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: AppTheme.lightTheme(context),
    onGenerateTitle: (final BuildContext context) =>
        AppLocalizations.of(context).appTitle,
    builder: (context, child) => AppContentBox(child: child!),
  );
}
