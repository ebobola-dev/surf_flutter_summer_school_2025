import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_data.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class OnboardingSubPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingSubPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.imagePath,
            width: screenWidth * .3,
            color: colorScheme.onBackground,
          ),
          const SizedBox(height: 48),
          Text(
            data.description1,
            style: textScheme.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            data.description2,
            style: textScheme.small.copyWith(color: colorScheme.inactiveBlack),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
