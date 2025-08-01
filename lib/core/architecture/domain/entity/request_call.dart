import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/request_operation.dart';

/// Typedef for repository method call.
typedef RequestCall<T> = RequestOperation<T> Function();
