import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_wm.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final IOnboardingWM wm;
  const OnboardingPageIndicator({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: wm.currentPage,
      builder: (_, currentPage, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            _IndicatorItem(isActive: currentPage == 0),
            _IndicatorItem(isActive: currentPage == 1),
            _IndicatorItem(isActive: currentPage == 2),
          ],
        );
      },
    );
  }
}

class _IndicatorItem extends StatelessWidget {
  final bool isActive;
  const _IndicatorItem({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInExpo,
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? colorScheme.primary : colorScheme.inactiveBlack,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
