import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/failure/failure.dart';

base class DatabaseFailure extends Failure<Object?> {
  final String? tableName;
  const DatabaseFailure({
    required super.original,
    super.stackTrace,
    super.message,
    this.tableName,
  });
}
