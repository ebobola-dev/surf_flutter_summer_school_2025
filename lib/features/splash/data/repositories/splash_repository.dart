import 'package:surf_flutter_summer_school_2025/features/splash/domain/repositories/i_splash_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/storage/first_run/i_first_run_storage.dart';

class SplashRepository implements ISplashRepository {
  final IFirstRunStorage _firstRunStorage;

  const SplashRepository({
    required IFirstRunStorage firstRunStorage,
  }) : _firstRunStorage = firstRunStorage;

  @override
  bool isFirstRun() => _firstRunStorage.getIsFirstRun();
}
