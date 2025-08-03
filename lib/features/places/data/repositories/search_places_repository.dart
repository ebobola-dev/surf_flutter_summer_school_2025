import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/core/data/repository/base_repository.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/search_result_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/repositories/i_search_places_repository.dart';

final class SearchPlacesRepository extends BaseRepository implements ISearchPlacesRepository {
  final PlacesApi _api;

  final ISearchResultDtoToEntityConverter _searchResultDtoToEntityConverter;

  const SearchPlacesRepository({
    required super.logWriter,
    required PlacesApi placesApi,
    required ISearchResultDtoToEntityConverter searchResultDtoToEntityConverter,
  }) : _api = placesApi,
       _searchResultDtoToEntityConverter = searchResultDtoToEntityConverter;

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
}
