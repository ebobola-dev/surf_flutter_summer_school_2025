import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/di/splash_scope.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: .95, end: 1).animate(_controller);
    _controller.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToApp();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToApp() async {
    final splashRepository = context.read<ISplashScope>().splashRepository;
    final appRouter = context.read<AppRouter>();

    final firstRun = splashRepository.isFirstRun();

    await Future.delayed(const Duration(seconds: 2));

    unawaited(appRouter.pushAndPopUntil(firstRun ? OnboardingRoute() : TabsRoute(), predicate: (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.secondary, colorScheme.primary],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [.05, 1],
            ),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => ScaleTransition(
                scale: _animation,
                child: child,
              ),
              child: Image.asset(
                Images.logo,
                width: screenWidth * .44,
                height: screenWidth * .44,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
