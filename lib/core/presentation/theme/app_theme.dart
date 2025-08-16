import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/presentation/theme/app_colors.dart';
import 'package:sample_btc_tracker/core/presentation/theme/text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.mainPurple,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
      appBarTheme: const AppBarTheme(color: AppColors.lightScaffoldBackground),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainPurple,
      ),
      cardColor: AppColors.mainWhite,
      canvasColor: AppColors.mainWhite,
      textTheme: appTextTheme(false),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: kIsWeb
              ? FadeUpwardsPageTransitionsBuilder()
              : CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.mainPurple,
        onPrimary: AppColors.mainWhite,
        secondary: AppColors.lightPurple,
        onSecondary: AppColors.mainWhite,
        error: AppColors.mainRed,
        onError: AppColors.mainWhite,
        surface: AppColors.lightestPurple,
        onSurface: AppColors.mainBlack,
        shadow: AppColors.mainWhite,
      ),
      dividerColor: AppColors.darkGray,
      disabledColor: AppColors.lightGray,
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGray,
        indent: 0,
        endIndent: 0,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: AppColors.mainDark),
        iconColor: AppColors.mainDark,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.mainPurple),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.mainRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.mainRed),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.mainPurple),
          foregroundColor: WidgetStateProperty.all(AppColors.mainWhite),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            AppColors.lightPurple.withValues(alpha: 0.5),
          ),
          foregroundColor: WidgetStateProperty.all(AppColors.mainWhite),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.mainPurple),
          ),
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.mainWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.mainWhite,
        modalBackgroundColor: AppColors.mainWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.mainPurple,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      appBarTheme: const AppBarTheme(color: AppColors.darkScaffoldBackground),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainPurple,
      ),
      cardColor: AppColors.mainDark,
      canvasColor: AppColors.mainDark,
      textTheme: appTextTheme(true),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: kIsWeb
              ? FadeUpwardsPageTransitionsBuilder()
              : CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.mainPurple,
        onPrimary: AppColors.mainDark,
        secondary: AppColors.lightPurple,
        onSecondary: AppColors.mainDark,
        error: AppColors.lightRed,
        onError: AppColors.mainDark,
        surface: AppColors.mainDark,
        onSurface: AppColors.mainWhite,
        shadow: AppColors.mainDark,
        primaryContainer: AppColors.mainDark,
        onPrimaryContainer: AppColors.mainWhite,
      ),
      dividerColor: AppColors.darkGray,
      disabledColor: AppColors.lightGray,
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGray,
        indent: 0,
        endIndent: 0,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: AppColors.mainWhite),
        iconColor: AppColors.mainWhite,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.mainPurple),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.mainWhite),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.lightRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.lightRed),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.mainPurple),
          foregroundColor: WidgetStateProperty.all(AppColors.mainBlack),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(16),
          ),
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all<Size>(
            const Size(double.infinity, 30),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(
            AppColors.lightPurple.withValues(alpha: 0.5),
          ),
          foregroundColor: WidgetStateProperty.all(AppColors.mainBlack),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.mainPurple),
          ),
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.mainDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.mainDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
    );
  }
}
