import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_data.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/widgets/indicator.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/widgets/sub_page.dart';

class OnboardingScreen extends ElementaryWidget<IOnboardingWM> {
  const OnboardingScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultOnboardingWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IOnboardingWM wm) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
            valueListenable: wm.currentPage,
            builder: (_, currentPage, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: currentPage == 2 ? SizedBox(key: ValueKey(true)) : child!,
              );
            },
            child: Padding(
              key: ValueKey(false),
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: wm.onContinueTap,
                child: Text('Пропустить'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: wm.onPageChanged,
              children: onboardingData.map((item) => OnboardingSubPage(data: item)).toList(),
            ),
          ),
          OnboardingPageIndicator(wm: wm),
          const SizedBox(height: 32),
          ValueListenableBuilder(
            valueListenable: wm.currentPage,
            builder: (_, currentPage, child) {
              return AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                offset: currentPage == 2 ? Offset.zero : Offset(0, 2),
                child: child,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: wm.onContinueTap,
                  child: Text('на старт'.toUpperCase()),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
