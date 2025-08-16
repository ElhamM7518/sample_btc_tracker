import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_btc_tracker/core/presentation/router/routes.dart';
import 'package:sample_btc_tracker/core/utils/extensions/on_context.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final Widget child;
  const MainBottomNavigationBar({required this.child, super.key});

  static const tabs = ['/btc', '/converter'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = tabs.indexWhere(location.startsWith);
    if (currentIndex == -1) currentIndex = 0;
    DateTime? lastPressed;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (popped, result) {
        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.themeData.dividerColor,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              content: Text(
                'Double-tap to exit! This action results in the loss of the currency price history.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.themeData.scaffoldBackgroundColor,
                ),
              ),
            ),
          );
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              const BTCListRouteData().go(context);
            } else {
              const ConverterRouteData().go(context);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.currency_bitcoin),
              label: context.l10n.bitcoin,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.currency_exchange),
              label: context.l10n.converter,
            ),
          ],
        ),
      ),
    );
  }
}
