import 'package:flutter/material.dart';

class AppContentBox extends StatelessWidget {
  final Widget child;
  const AppContentBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: child,
      ),
    );
  }
}
