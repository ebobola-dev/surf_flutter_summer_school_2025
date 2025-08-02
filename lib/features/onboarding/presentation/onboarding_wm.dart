import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/di/onboarding_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_model.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_screen.dart';

OnboardingWM defaultOnboardingWMFactory(BuildContext context) {
  final placesScope = context.read<IOnboardingScope>();
  final appRouter = context.read<AppRouter>();
  return OnboardingWM(
    OnboardingModel(
      onboardingRepository: placesScope.onboardingRepository,
    ),
    appRouter: appRouter,
  );
}

abstract interface class IOnboardingWM with ThemeIModelMixin implements IWidgetModel {
  ValueListenable<int> get currentPage;

  void onPageChanged(int newPage);
  void onContinueTap();
}

final class OnboardingWM extends WidgetModel<OnboardingScreen, OnboardingModel>
    with ThemeWMMixin
    implements IOnboardingWM {
  OnboardingWM(
    super._model, {
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;
  final _currentPage = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentPage.dispose();
    super.dispose();
  }

  @override
  ValueListenable<int> get currentPage => _currentPage;

  @override
  void onPageChanged(int newPage) {
    _currentPage.emit(newPage);
  }

  @override
  Future<void> onContinueTap() async {
    await model.setFirstRunPassed();
    if (_appRouter.stack.length == 1) {
      // Если мы одни в стаке, пушим главный экран
      unawaited(_appRouter.pushAndPopUntil(TabsRoute(), predicate: (route) => false));
    } else {
      // Если мы не одни в стаке, значит туториал открыли принудительно, просто выходим с экрана назад
      _appRouter.pop();
    }
  }
}
