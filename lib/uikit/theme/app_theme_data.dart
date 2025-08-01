import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light theme configuration.
  static final lightTheme = ThemeData(
    extensions: [_lightColorScheme, _textScheme],
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightColorScheme.background,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.danger,
      onError: _lightColorScheme.onDanger,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
      centerTitle: true,
      titleTextStyle: _textScheme.subtitle.copyWith(color: _lightColorScheme.onPrimary),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _lightColorScheme.background,
      indicatorColor: Colors.transparent,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(color: _lightColorScheme.onPrimary),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: _textScheme.text.copyWith(color: _lightColorScheme.onBackground),
      subtitleTextStyle: _textScheme.superSmall.copyWith(color: _lightColorScheme.onBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textScheme.button.copyWith(decoration: TextDecoration.underline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(color: _lightColorScheme.inactiveBlack),
  );

  /// Dark theme configuration.
  static final darkTheme = ThemeData(
    extensions: [_darkColorScheme, _textScheme],
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.danger,
      onError: _darkColorScheme.onDanger,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkColorScheme.primary,
      iconTheme: IconThemeData(color: _darkColorScheme.onPrimary),
      centerTitle: true,
      titleTextStyle: _textScheme.subtitle.copyWith(color: _darkColorScheme.onPrimary),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _darkColorScheme.background,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.primary,
      contentTextStyle: TextStyle(color: _darkColorScheme.onPrimary),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: _textScheme.text.copyWith(color: _darkColorScheme.onBackground),
      subtitleTextStyle: _textScheme.superSmall.copyWith(color: _darkColorScheme.onBackground),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textScheme.button.copyWith(decoration: TextDecoration.underline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    ),
    dividerTheme: DividerThemeData(color: _darkColorScheme.inactiveBlack),
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
  static final _textScheme = AppTextScheme.base();
}
