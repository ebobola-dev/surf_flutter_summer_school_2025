import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/categories.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class CategoryItemWidget extends StatelessWidget {
  final Categories category;
  final bool isActive;
  final VoidCallback onTap;
  const CategoryItemWidget({required this.category, required this.isActive, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary.withAlpha(40),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        category.iconPath,
                        width: 32,
                        height: 32,
                        colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(.95, .95),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      switchInCurve: Curves.easeOutExpo,
                      switchOutCurve: Curves.easeOutExpo,
                      transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                      child: isActive
                          ? SizedBox(
                              key: ValueKey(true),
                              width: 16,
                              height: 16,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: colorScheme.onBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  SvgIcons.check,
                                  colorFilter: ColorFilter.mode(colorScheme.background, BlendMode.srcIn),
                                ),
                              ),
                            )
                          : SizedBox(key: ValueKey(false)),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              category.ruName,
              style: textScheme.superSmall,
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
