// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_text_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTextSchemeTailorMixin on ThemeExtension<AppTextScheme> {
  TextStyle get button;
  TextStyle get largeTitle;
  TextStyle get small;
  TextStyle get smallBold;
  TextStyle get subtitle;
  TextStyle get superSmall;
  TextStyle get textMedium;
  TextStyle get text;
  TextStyle get title;

  @override
  AppTextScheme copyWith({
    TextStyle? button,
    TextStyle? largeTitle,
    TextStyle? small,
    TextStyle? smallBold,
    TextStyle? subtitle,
    TextStyle? superSmall,
    TextStyle? textMedium,
    TextStyle? text,
    TextStyle? title,
  }) {
    return AppTextScheme(
      button: button ?? this.button,
      largeTitle: largeTitle ?? this.largeTitle,
      small: small ?? this.small,
      smallBold: smallBold ?? this.smallBold,
      subtitle: subtitle ?? this.subtitle,
      superSmall: superSmall ?? this.superSmall,
      textMedium: textMedium ?? this.textMedium,
      text: text ?? this.text,
      title: title ?? this.title,
    );
  }

  @override
  AppTextScheme lerp(covariant ThemeExtension<AppTextScheme>? other, double t) {
    if (other is! AppTextScheme) return this as AppTextScheme;
    return AppTextScheme(
      button: TextStyle.lerp(button, other.button, t)!,
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      superSmall: TextStyle.lerp(superSmall, other.superSmall, t)!,
      textMedium: TextStyle.lerp(textMedium, other.textMedium, t)!,
      text: TextStyle.lerp(text, other.text, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextScheme &&
            const DeepCollectionEquality().equals(button, other.button) &&
            const DeepCollectionEquality().equals(
              largeTitle,
              other.largeTitle,
            ) &&
            const DeepCollectionEquality().equals(small, other.small) &&
            const DeepCollectionEquality().equals(smallBold, other.smallBold) &&
            const DeepCollectionEquality().equals(subtitle, other.subtitle) &&
            const DeepCollectionEquality().equals(
              superSmall,
              other.superSmall,
            ) &&
            const DeepCollectionEquality().equals(
              textMedium,
              other.textMedium,
            ) &&
            const DeepCollectionEquality().equals(text, other.text) &&
            const DeepCollectionEquality().equals(title, other.title));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(button),
      const DeepCollectionEquality().hash(largeTitle),
      const DeepCollectionEquality().hash(small),
      const DeepCollectionEquality().hash(smallBold),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(superSmall),
      const DeepCollectionEquality().hash(textMedium),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(title),
    );
  }
}

extension AppTextSchemeBuildContext on BuildContext {
  AppTextScheme get appTextScheme => Theme.of(this).extension<AppTextScheme>()!;
}
