import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/failure/database/database_failure.dart';

final class RecordNotFound extends DatabaseFailure {
  const RecordNotFound({
    required super.tableName,
    super.original,
    super.stackTrace,
    super.message,
  });

  @override
  String toString() {
    final buffer = StringBuffer('[DatabaseFailure] Record not found in table "$tableName"');
    if (message != null && message!.isNotEmpty) {
      buffer
        ..writeln()
        ..write(message);
    }
    return buffer.toString();
  }
}
