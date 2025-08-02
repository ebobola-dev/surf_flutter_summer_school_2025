import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/di_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/di/onboarding_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_screen.dart';

@RoutePage()
class OnboardingFlow extends StatelessWidget implements AutoRouteWrapper {
  const OnboardingFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IOnboardingScope>(
      factory: OnboardingScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}
