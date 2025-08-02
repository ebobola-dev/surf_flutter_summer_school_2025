import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/i_disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/domain/repositories/i_ondoarding_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/storage/first_run/first_run_storage.dart';

final class OnboardingScope extends DisposableObject implements IOnboardingScope {
  @override
  final IOnboardingRepository onboardingRepository;

  OnboardingScope({required this.onboardingRepository});

  factory OnboardingScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();

    final placesRepository = OnboardingRepository(
      firstRunStorage: FirstRunStorage(appScope.sharedPreferences),
    );

    return OnboardingScope(onboardingRepository: placesRepository);
  }
}

abstract interface class IOnboardingScope implements IDisposableObject {
  IOnboardingRepository get onboardingRepository;
}
