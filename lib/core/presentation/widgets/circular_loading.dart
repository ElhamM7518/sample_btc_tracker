import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/infrastructure/environment_variables.dart';
import 'package:sample_btc_tracker/core/utils/extensions/extensions.dart';

class CircularLoading extends StatelessWidget {
  final Size? size;
  final double? strokeWidth;
  final Color? color;

  const CircularLoading({super.key, this.size, this.strokeWidth, this.color});

  @override
  Widget build(BuildContext context) {
    final secondaryColor = context.themeData.primaryColor;

    return Center(
      child: SizedBox(
        width: size?.width ?? 48,
        height: size?.height ?? 48,
        child: EnvironmentVariables.environment == Environment.test
            ? CircularProgressIndicator(
                value: 0.3,
                color: color ?? secondaryColor,
                backgroundColor:
                    color?.withValues(alpha: 0.1) ??
                    secondaryColor.withValues(alpha: 0.1),
                strokeWidth: strokeWidth ?? 8,
              )
            : CircularProgressIndicator(
                color: color ?? secondaryColor,
                backgroundColor:
                    color?.withValues(alpha: 0.1) ??
                    secondaryColor.withValues(alpha: 0.1),
                strokeWidth: strokeWidth ?? 8,
              ),
      ),
    );
  }
}
