import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';

abstract interface class ISearchPlacesRepository {
  RequestOperation<SearchResultEntity> search({
    required String query,
    int offset = 0,
    int limit = 10,
  });
}
