// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainShellRouteData];

RouteBase get $mainShellRouteData => ShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/btc',

      factory: _$BTCListRouteData._fromState,
      routes: [
        GoRouteData.$route(
          path: 'currency-history/:currency',

          factory: _$CurrencyHistoryRouteData._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/converter',

      factory: _$ConverterRouteData._fromState,
    ),
  ],
);

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

mixin _$BTCListRouteData on GoRouteData {
  static BTCListRouteData _fromState(GoRouterState state) =>
      const BTCListRouteData();

  @override
  String get location => GoRouteData.$location('/btc');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$CurrencyHistoryRouteData on GoRouteData {
  static CurrencyHistoryRouteData _fromState(GoRouterState state) =>
      CurrencyHistoryRouteData(
        _$CurrencyEnumMap._$fromName(state.pathParameters['currency']!)!,
      );

  CurrencyHistoryRouteData get _self => this as CurrencyHistoryRouteData;

  @override
  String get location => GoRouteData.$location(
    '/btc/currency-history/${Uri.encodeComponent(_$CurrencyEnumMap[_self.currency]!)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

const _$CurrencyEnumMap = {
  Currency.usd: 'usd',
  Currency.gbp: 'gbp',
  Currency.eur: 'eur',
};

mixin _$ConverterRouteData on GoRouteData {
  static ConverterRouteData _fromState(GoRouterState state) =>
      const ConverterRouteData();

  @override
  String get location => GoRouteData.$location('/converter');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
