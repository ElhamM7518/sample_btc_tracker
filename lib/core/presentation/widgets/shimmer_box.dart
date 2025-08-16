import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final BoxShape shape;

  const ShimmerBox({
    required this.width,
    required this.height,
    this.radius = 0,
    this.shape = BoxShape.rectangle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(seconds: 1),
      color: context.isDarkMode ? AppColors.mainDark : AppColors.mainWhite,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.mainDark
              : AppColors.lightestGray,
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
