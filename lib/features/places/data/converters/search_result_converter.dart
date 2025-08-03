import 'package:surf_flutter_summer_school_2025/api/places/search_result_dto.dart';
import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/found_place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/found_place.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';

/// Конвертер из [SearchResultDto] в [SearchResultEntity].
typedef ISearchResultDtoToEntityConverter = Converter<SearchResultEntity, SearchResultDto>;

/// Реализация [ISearchResultDtoToEntityConverter].
final class SearchResultDtoToEntityConverter extends ISearchResultDtoToEntityConverter {
  /// Конвертер для голых мест
  final IFoundPlaceDtoToEntityConverter foundPlaceDtoToEntityConverter;

  const SearchResultDtoToEntityConverter({required this.foundPlaceDtoToEntityConverter});

  @override
  SearchResultEntity convert(SearchResultDto input) {
    final resultsList = foundPlaceDtoToEntityConverter.convertMultiple(input.results).toList();
    final resultsMap = SortedMap<int, FoundPlaceEntity>.fromList(
      list: resultsList,
      getId: (fp) => fp.placeId,
    );
    return SearchResultEntity(
      query: input.query,
      total: input.total,
      results: resultsMap,
    );
  }
}
