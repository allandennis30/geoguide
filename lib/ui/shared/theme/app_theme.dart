// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:geoguide/ui/shared/theme/app_typography.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

class AppTheme {
  const AppTheme._();
  static const outlinedButtonDefaultBorderColor =
      Color.fromARGB(255, 217, 217, 217);

  // Base
  static const baseBorderRadius = BorderRadius.all(Radius.circular(2));

  // Card
  static const cardBorderColor = Color.fromARGB(100, 188, 198, 208);
  static const cardElevation = 0.0;
  static const cardBorderRadius = BorderRadius.all(Radius.circular(4));
  static const cardBorderSize = 1.0;

  /// Returns the base padding that should be used for popups with forms
  static EdgeInsetsGeometry get defaultPagePadding {
    return const EdgeInsets.all(AppSpacing.sm);
  }

  static InputDecoration getBaseInputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      isCollapsed: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      prefixIconConstraints: const BoxConstraints(),
      suffixIconConstraints: const BoxConstraints(),
      hintStyle: TypographyLight.mdBody.copyWith(
        color: AppColors.grey600,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red500.withAlpha(100),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red500,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey300,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey300,
        ),
      ),
      errorMaxLines: 8,
    );
  }

  static ThemeData toThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
      primaryColor: AppColors.primary,
      splashColor: AppColors.secondary,
      highlightColor: AppColors.primary,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.white500,
        secondary: AppColors.primary,
        onSecondary: AppColors.white500,
        error: AppColors.red500,
        onError: AppColors.white500,
        background: AppColors.white500,
        onBackground: AppColors.primaryText,
        surface: AppColors.grey300,
        onSurface: AppColors.primaryText,
      ),
      dividerColor: AppColors.disabledColor,
      cardTheme: const CardTheme(
        elevation: cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: cardBorderRadius,
          side: BorderSide(
            color: cardBorderColor,
            width: cardBorderSize,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabledColor;
            }

            return AppColors.primary;
          }),
          overlayColor: MaterialStateProperty.all(AppColors.secondary),
          elevation: MaterialStateProperty.all(0.0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.secondary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(AppColors.secondary),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
