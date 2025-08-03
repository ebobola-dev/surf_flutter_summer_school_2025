import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_color_scheme.tailor.dart';

@immutable
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppColorScheme extends ThemeExtension<AppColorScheme> with _$AppColorSchemeTailorMixin {
  @override
  final Color primary;
  @override
  final Color onPrimary;
  @override
  final Color secondary;
  @override
  final Color onSecondary;
  @override
  final Color secondary2;
  @override
  final Color surface;
  @override
  final Color onSurface;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color danger;
  @override
  final Color onDanger;
  @override
  final Color textField;
  @override
  final Color white;
  @override
  final Color inactiveBlack;
  @override
  final Color text;
  @override
  final Color textSecondary;
  @override
  final Color textTertiary;

  const AppColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.secondary2,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.danger,
    required this.onDanger,
    required this.textField,
    required this.white,
    required this.inactiveBlack,
    required this.text,
    required this.textSecondary,
    required this.textTertiary,
  });

  /// Base light theme version.
  AppColorScheme.light()
    : primary = const Color(0xFF4CAF50),
      onPrimary = const Color(0xFFFFFFFF),
      secondary = const Color(0xFFFCDD3D),
      onSecondary = const Color(0xFFFFFFFF),
      secondary2 = const Color(0xFF7C7E92),
      surface = const Color(0xFFF5F5F5),
      onSurface = const Color(0xFF081B30),
      background = const Color(0xFFFFFFFF),
      onBackground = const Color(0xFF252849),
      danger = const Color(0xFFEF4343),
      onDanger = const Color(0xFFFFFFFF),
      textField = const Color(0xFF171717),
      white = const Color(0xFFFFFFFF),
      inactiveBlack = Color(0xFF7C7E92).withAlpha(140),
      text = const Color(0xFF252849),
      textSecondary = const Color(0xFF3B335B),
      textTertiary = const Color(0xFF7C7392);

  /// Base dark theme version.
  AppColorScheme.dark()
    : primary = const Color(0xFF71D675),
      onPrimary = const Color(0xFFFFFFFF),
      secondary = const Color(0xFFFFE769),
      onSecondary = const Color(0xFFFFFFFF),
      secondary2 = const Color(0xFF7C7E92),
      surface = const Color(0xFF1A1A20),
      onSurface = const Color(0xFFFFFFFF),
      background = const Color(0xFF21222C),
      onBackground = const Color(0xFFFFFFFF),
      danger = const Color(0xFFCF2A2A),
      onDanger = const Color(0xFFFFFFFF),
      textField = const Color(0xFFD6D6D6),
      white = const Color(0xFFFFFFFF),
      inactiveBlack = Color(0xFF7C7E92).withAlpha(140),
      text = const Color(0xFFFFFFFF),
      textSecondary = const Color(0xFFFFFFFF),
      textTertiary = const Color(0xFF7C7392);
}
