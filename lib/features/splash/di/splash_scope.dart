import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/i_disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/data/repositories/splash_repository.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/domain/repositories/i_splash_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/storage/first_run/first_run_storage.dart';

final class SplashScope extends DisposableObject implements ISplashScope {
  @override
  final ISplashRepository splashRepository;

  SplashScope({required this.splashRepository});

  factory SplashScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();

    final placesRepository = SplashRepository(
      firstRunStorage: FirstRunStorage(appScope.sharedPreferences),
    );

    return SplashScope(splashRepository: placesRepository);
  }
}

abstract interface class ISplashScope implements IDisposableObject {
  ISplashRepository get splashRepository;
}
