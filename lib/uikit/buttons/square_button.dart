import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

class SquareButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Widget icon;
  const SquareButton({
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor ?? colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: icon),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
