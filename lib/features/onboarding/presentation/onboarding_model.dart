import 'package:elementary/elementary.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/domain/repositories/i_ondoarding_repository.dart';

class OnboardingModel extends ElementaryModel {
  final IOnboardingRepository _repository;

  OnboardingModel({
    required IOnboardingRepository onboardingRepository,
  }) : _repository = onboardingRepository;

  Future<void> setFirstRunPassed() async => _repository.setFirstRunPassed();
}
