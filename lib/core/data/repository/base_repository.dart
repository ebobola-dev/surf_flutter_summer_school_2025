import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_2025/api/services/errors/error_response_dto.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/logger/i_log_writer.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/api_failure.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/failure.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/result.dart';

typedef RequestOperationCallback<T> = RequestOperation<T> Function();

/// {@template base_repository.class}
/// Базовый класс для всех репозиториев в приложении.
/// {@endtemplate}
abstract base class BaseRepository {
  /// {@macro i_log_writer.class}
  final ILogWriter logWriter;

  /// {@macro base_repository.class}
  const BaseRepository({required this.logWriter});

  /// Обёртка для стандартной обработки ошибок обращения к API.
  @protected
  RequestOperation<T> makeApiCall<T>(AsyncValueGetter<T> call) async {
    final Result<T, Failure> failureResult;

    try {
      final data = await call();

      return Result.ok(data);
    } on DioException catch (e, s) {
      failureResult = Result.failed(unwrapDioException(e, trace: s));
    } on Failure catch (e, s) {
      return Result.failed(Failure(original: e, stackTrace: s));
    } on Object catch (e, s) {
      failureResult = Result.failed(Failure(original: e, stackTrace: s));
    }

    if (failureResult case ResultFailed(:final failure)) {
      _logFailure(failure);
    }

    return failureResult;
  }

  /// Маппинг ошибки API.
  @protected
  ApiFailure unwrapDioException(DioException exception, {required StackTrace trace}) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ApiFailure(
          original: exception,
          stackTrace: trace,
          errorMessage: 'Server not responding',
        );
      case DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.cancel ||
          DioExceptionType.connectionTimeout ||
          DioExceptionType.connectionError:
        return ApiFailure(
          original: exception,
          stackTrace: trace,
          errorMessage: 'No network connection',
        );
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;

        ErrorResponseDto? errorResponse;
        if (exception.response?.data case final Map<String, dynamic> data) {
          try {
            errorResponse = ErrorResponseDto.fromJson(data);
          } on Object catch (e, s) {
            _logFailure(Failure(original: e, stackTrace: s));
          }
        }

        if (statusCode == 400) {
          return ApiFailure(
            original: exception,
            stackTrace: trace,
            errorMessage: errorResponse?.detail ?? 'No message',
          );
        }
        if (statusCode == 429) {
          try {
            return ApiFailure(
              original: exception,
              stackTrace: trace,
              errorMessage: errorResponse?.detail ?? 'Too many requests',
            );
          } on Object catch (e, s) {
            _logFailure(Failure(original: e, stackTrace: s));
          }
        }
        if (statusCode == 401) {
          return ApiFailure(
            original: exception,
            stackTrace: trace,
            errorMessage: 'Unauthorized',
          );
        }
        if (statusCode == 500) {
          return ApiFailure(
            original: exception,
            stackTrace: trace,
            errorMessage: errorResponse?.detail ?? 'Internal server error',
          );
        }
        if (statusCode == 404) {
          return ApiFailure(
            original: exception,
            stackTrace: trace,
            errorMessage: errorResponse?.detail ?? 'Not found',
          );
        }

      default:
        return ApiFailure.unknown(error: exception, stackTrace: trace);
    }

    return ApiFailure.unknown(error: exception, stackTrace: trace);
  }

  void _logFailure(Failure failure) {
    logWriter.failure(failure);
  }
}
