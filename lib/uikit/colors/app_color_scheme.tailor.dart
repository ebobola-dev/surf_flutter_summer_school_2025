// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_color_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorSchemeTailorMixin on ThemeExtension<AppColorScheme> {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;
  Color get danger;
  Color get onDanger;
  Color get textField;
  Color get white;
  Color get inactiveBlack;
  Color get text;
  Color get textSecondary;
  Color get textTertiary;

  @override
  AppColorScheme copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? danger,
    Color? onDanger,
    Color? textField,
    Color? white,
    Color? inactiveBlack,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      textField: textField ?? this.textField,
      white: white ?? this.white,
      inactiveBlack: inactiveBlack ?? this.inactiveBlack,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
    );
  }

  @override
  AppColorScheme lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this as AppColorScheme;
    return AppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      white: Color.lerp(white, other.white, t)!,
      inactiveBlack: Color.lerp(inactiveBlack, other.inactiveBlack, t)!,
      text: Color.lerp(text, other.text, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorScheme &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality().equals(
              onSecondary,
              other.onSecondary,
            ) &&
            const DeepCollectionEquality().equals(surface, other.surface) &&
            const DeepCollectionEquality().equals(onSurface, other.onSurface) &&
            const DeepCollectionEquality().equals(
              background,
              other.background,
            ) &&
            const DeepCollectionEquality().equals(
              onBackground,
              other.onBackground,
            ) &&
            const DeepCollectionEquality().equals(danger, other.danger) &&
            const DeepCollectionEquality().equals(onDanger, other.onDanger) &&
            const DeepCollectionEquality().equals(textField, other.textField) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality().equals(
              inactiveBlack,
              other.inactiveBlack,
            ) &&
            const DeepCollectionEquality().equals(text, other.text) &&
            const DeepCollectionEquality().equals(
              textSecondary,
              other.textSecondary,
            ) &&
            const DeepCollectionEquality().equals(
              textTertiary,
              other.textTertiary,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(onSecondary),
      const DeepCollectionEquality().hash(surface),
      const DeepCollectionEquality().hash(onSurface),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(danger),
      const DeepCollectionEquality().hash(onDanger),
      const DeepCollectionEquality().hash(textField),
      const DeepCollectionEquality().hash(white),
      const DeepCollectionEquality().hash(inactiveBlack),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(textSecondary),
      const DeepCollectionEquality().hash(textTertiary),
    );
  }
}

extension AppColorSchemeBuildContext on BuildContext {
  AppColorScheme get appColorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;
}
