import 'package:surf_flutter_summer_school_2025/features/onboarding/domain/repositories/i_ondoarding_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/storage/first_run/i_first_run_storage.dart';

class OnboardingRepository implements IOnboardingRepository {
  final IFirstRunStorage _firstRunStorage;

  OnboardingRepository({
    required IFirstRunStorage firstRunStorage,
  }) : _firstRunStorage = firstRunStorage;

  @override
  Future<void> setFirstRunPassed() {
    return _firstRunStorage.setIsFirstRun(value: false);
  }
}
