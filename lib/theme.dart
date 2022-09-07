import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD7555B);
  static const textDark = Color(0xFF53585A);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColor{
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColor{
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

// Reference to app theme
abstract class AppTheme{
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

//  Light Theme and setting
  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme()
      .apply(bodyColor: AppColors.textDark),
    backgroundColor: _LightColor.background,
    scaffoldBackgroundColor: _LightColor.background,
    cardColor: _LightColor.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
  );

//  Dark Theme and setting
  static ThemeData dark() => ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor, brightness: Brightness.dark),
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme()
        .apply(bodyColor: AppColors.textLight),
    backgroundColor: _DarkColor.background,
    scaffoldBackgroundColor: _DarkColor.background,
    cardColor: _DarkColor.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textLight),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconLight),
  );
}