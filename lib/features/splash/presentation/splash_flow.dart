import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/di_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/di/splash_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/presentation/splash_screen.dart';

@RoutePage()
class SplashFlow extends StatelessWidget implements AutoRouteWrapper {
  const SplashFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<ISplashScope>(
      factory: SplashScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
