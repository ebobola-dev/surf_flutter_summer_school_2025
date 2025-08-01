import 'package:dio/dio.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/failure.dart';

base class ApiFailure extends Failure<DioException> {
  final int? statusCode;
  final int? responseBodyCode;
  final String errorMessage;

  const ApiFailure({
    required this.errorMessage,
    required super.original,
    super.stackTrace,
    this.statusCode,
    this.responseBodyCode,
  });

  factory ApiFailure.unknown({
    required DioException error,
    StackTrace? stackTrace,
    String message = 'Unknown server error',
    int? statusCode,
  }) {
    return ApiFailure(
      original: error,
      stackTrace: stackTrace,
      statusCode: statusCode,
      errorMessage: message,
    );
  }
}
