import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const AppTextField({
    this.hintText,
    super.key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).focusedChild?.unfocus(),
      controller: controller,
      style: textScheme.text.copyWith(color: colorScheme.text),
      decoration: InputDecoration(
        fillColor: colorScheme.surface,
        filled: true,
        hintText: hintText,
        hintStyle: textScheme.text.copyWith(color: colorScheme.inactiveBlack),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
