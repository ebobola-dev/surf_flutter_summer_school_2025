import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/text_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_text_scheme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppTextScheme extends ThemeExtension<AppTextScheme> with _$AppTextSchemeTailorMixin {
  @override
  final TextStyle button;
  @override
  final TextStyle largeTitle;
  @override
  final TextStyle small;
  @override
  final TextStyle smallBold;
  @override
  final TextStyle subtitle;
  @override
  final TextStyle superSmall;
  @override
  final TextStyle textMedium;
  @override
  final TextStyle text;
  @override
  final TextStyle title;

  const AppTextScheme({
    required this.largeTitle,
    required this.title,
    required this.subtitle,
    required this.textMedium,
    required this.text,
    required this.smallBold,
    required this.small,
    required this.superSmall,
    required this.button,
  });

  AppTextScheme.base()
    : largeTitle = AppTextStyle.largeTitle.value,
      title = AppTextStyle.title.value,
      subtitle = AppTextStyle.subtitle.value,
      textMedium = AppTextStyle.textMedium.value,
      text = AppTextStyle.text.value,
      smallBold = AppTextStyle.smallBold.value,
      small = AppTextStyle.small.value,
      superSmall = AppTextStyle.superSmall.value,
      button = AppTextStyle.button.value;
}
