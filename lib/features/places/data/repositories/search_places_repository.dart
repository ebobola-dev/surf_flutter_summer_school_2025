import 'dart:async';

import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/core/data/repository/base_repository.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/search_result_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/searched_item_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/repositories/i_search_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/search_history/i_search_history_database.dart';

final class SearchPlacesRepository extends BaseRepository implements ISearchPlacesRepository {
  final PlacesApi _api;
  final ISearchHistoryDatabase _searchHistoryDatabase;

  final ISearchResultDtoToEntityConverter _searchResultDtoToEntityConverter;

  final ISearchedItemSchemaToEntityConverter _searchedItemSchemaToEntityConverter;

  const SearchPlacesRepository({
    required super.logWriter,
    required PlacesApi placesApi,
    required ISearchHistoryDatabase searchHistoryDatabase,
    required ISearchResultDtoToEntityConverter searchResultDtoToEntityConverter,
    required ISearchedItemSchemaToEntityConverter searchedItemSchemaToEntityConverter,
  }) : _api = placesApi,
       _searchHistoryDatabase = searchHistoryDatabase,
       _searchResultDtoToEntityConverter = searchResultDtoToEntityConverter,
       _searchedItemSchemaToEntityConverter = searchedItemSchemaToEntityConverter;

  @override
  RequestOperation<SearchResultEntity> search({
    required String query,
    int offset = 0,
    int limit = 10,
  }) {
    return makeCall(() async {
      final searchResultDto = await _api.search(
        query: query,
        offset: offset,
        limit: limit,
      );
      final searchResultEntity = _searchResultDtoToEntityConverter.convert(searchResultDto);
      return searchResultEntity;
    });
  }

  @override
  RequestOperation<List<SearchedItemEntity>> getSearchHistory() async {
    return makeCall(() async {
      final searchedSchemes = await _searchHistoryDatabase.getAll();
      final searchedEntities = _searchedItemSchemaToEntityConverter.convertMultiple(searchedSchemes).toList();
      return searchedEntities;
    });
  }

  // Сохранять query в бд можно было бы и тут внутри, при запросе search()
  // Но тогда мы будем сохранять весь мусор (если пользователь будет вводить медленно)
  // Так как тут, внутри репо, мы не знаем что именно дойдёт до ui
  // Лучше сохранить то, что ui решит показать пользователю
  @override
  RequestOperation<SearchedItemEntity> saveQueryToSearchHistory(String query) async {
    return makeCall(() async {
      final itemSchema = await _searchHistoryDatabase.createOrUpdate(query);
      final itemEntity = _searchedItemSchemaToEntityConverter.convert(itemSchema);
      return itemEntity;
    });
  }

  @override
  RequestOperation<void> deleteQueryFromHistory(String query) async {
    return makeCall(() async {
      await _searchHistoryDatabase.delete(query);
    });
  }

  @override
  RequestOperation<void> clearHistory() async {
    return makeCall(() async {
      await _searchHistoryDatabase.clear();
    });
  }

  @override
  Stream<List<SearchedItemEntity>> get historyStream => _searchHistoryDatabase.allStream.map(
    (e) => _searchedItemSchemaToEntityConverter.convertMultiple(e).toList(),
  );
}
