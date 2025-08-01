import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_2025/api/app_dio_configurator.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/logger/log_writer.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/logger/strategies/debug_log_strategy.dart';
import 'package:surf_flutter_summer_school_2025/config/app_config.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';
import 'package:surf_logger/surf_logger.dart' as surf_logger;

/// {@template app_scope_register.class}
/// Creates and initializes AppScope.
/// {@endtemplate}
final class AppScopeRegister {
  /// {@macro app_scope_register.class}
  const AppScopeRegister();

  /// Create scope.
  Future<IAppScope> createScope() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final persistentDatabase = PersistentDatabase();

    final appConfig = AppConfig(apiUrl: 'http://109.73.206.134:8888/api');

    const dioConfigurator = AppDioConfigurator();
    final interceptors = <Interceptor>[
      if (kDebugMode)
        // Fake delay for debug mode
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            await Future.delayed(const Duration(seconds: 1));
            handler.next(options);
          },
        ),
    ];
    final dio = dioConfigurator.create(
      interceptors: interceptors,
      url: appConfig.apiUrl,
    );

    final surfLogger = surf_logger.Logger.withStrategies({
      if (!kReleaseMode) DebugLogStrategy(Logger(printer: PrettyPrinter(methodCount: 0))),
    });
    final logger = LogWriter(surfLogger);

    return AppScope(
      appConfig: appConfig,
      sharedPreferences: sharedPreferences,
      persistentDatabase: persistentDatabase,
      dio: dio,
      logger: logger,
    );
  }
}
