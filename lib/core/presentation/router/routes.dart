import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_btc_tracker/features/btc/domain/currency_enum.dart';
import 'package:sample_btc_tracker/features/btc/presentation/btc_page.dart';
import 'package:sample_btc_tracker/features/converter/presentation/converter_page.dart';
import 'package:sample_btc_tracker/features/currency_history/presentation/currency_history_page.dart';
import 'package:sample_btc_tracker/features/layout/bottom_navigation_bar.dart';

part 'routes.g.dart';

class ErrorRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page Not Found!',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}

@TypedShellRoute<MainShellRouteData>(
  routes: [
    TypedGoRoute<BTCListRouteData>(
      path: '/btc',
      routes: [
        TypedGoRoute<CurrencyHistoryRouteData>(
          path: 'currency-history/:currency',
        ),
      ],
    ),
    TypedGoRoute<ConverterRouteData>(path: '/converter'),
  ],
)
class MainShellRouteData extends ShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainBottomNavigationBar(child: navigator);
  }
}

class BTCListRouteData extends GoRouteData with _$BTCListRouteData {
  const BTCListRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BtcPage();
  }
}

class CurrencyHistoryRouteData extends GoRouteData
    with _$CurrencyHistoryRouteData {
  final Currency currency;
  const CurrencyHistoryRouteData(this.currency);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CurrencyHistoryPage(currency: currency);
  }
}

class ConverterRouteData extends GoRouteData with _$ConverterRouteData {
  const ConverterRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConverterPage();
  }
}
