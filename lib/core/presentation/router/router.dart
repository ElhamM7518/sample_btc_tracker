import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_btc_tracker/core/presentation/router/routes.dart';

final routerNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: routerNavigatorKey,
  debugLogDiagnostics: kDebugMode,
  errorBuilder: (context, state) => ErrorRoute().build(context, state),
  initialLocation: const BTCListRouteData().location,
  routes: $appRoutes,
);
