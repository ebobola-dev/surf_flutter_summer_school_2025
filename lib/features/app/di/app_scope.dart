import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/logger/i_log_writer.dart';
import 'package:surf_flutter_summer_school_2025/config/app_config.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  @override
  final AppConfig appConfig;
  @override
  final SharedPreferences sharedPreferences;
  @override
  final PersistentDatabase persistentDatabase;
  @override
  final Dio dio;
  @override
  final ILogWriter logger;

  /// {@macro app_scope.class}
  const AppScope({
    required this.appConfig,
    required this.sharedPreferences,
    required this.persistentDatabase,
    required this.dio,
    required this.logger,
  });
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  Dio get dio;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Drift Database - saved when cache is cleared
  PersistentDatabase get persistentDatabase;

  /// Logger.
  ILogWriter get logger;
}
