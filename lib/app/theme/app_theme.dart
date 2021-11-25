import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/app/theme/app_dimens.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

export 'app_text_theme.dart' show TextStyleX;

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.light().textTheme),
      colorScheme: ColorScheme.light(primary: appColors.primary),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      colorScheme: ColorScheme.dark(primary: appColors.primary),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: AppDimens.kButtonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.kRadius),
          ),
        ),
      ),
    );

    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}
