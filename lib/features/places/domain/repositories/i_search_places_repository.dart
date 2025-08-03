import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';

abstract interface class ISearchPlacesRepository {
  RequestOperation<SearchResultEntity> search({
    required String query,
    int offset = 0,
    int limit = 10,
  });

  RequestOperation<List<SearchedItemEntity>> getSearchHistory();
  RequestOperation<SearchedItemEntity> saveQueryToSearchHistory(String query);
  RequestOperation<void> deleteQueryFromHistory(String query);
  RequestOperation<void> clearHistory();

  Stream<List<SearchedItemEntity>> get historyStream;
}
