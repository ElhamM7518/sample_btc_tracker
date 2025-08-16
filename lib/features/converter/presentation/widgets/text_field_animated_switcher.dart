import 'package:flutter/material.dart';

class TextFieldAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final Offset begin;
  const TextFieldAnimatedSwitcher({
    required this.child,
    required this.begin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: begin,
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: child,
    );
  }
}
