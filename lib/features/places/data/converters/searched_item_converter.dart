import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// Конвертер из [SearchedItemScheme] в [SearchedItemEntity].
typedef ISearchedItemSchemeToEntityConverter = Converter<SearchedItemEntity, SearchedItemScheme>;

/// Реализация [ISearchedItemSchemeToEntityConverter].
final class SearchedItemSchemeToEntityConverter extends ISearchedItemSchemeToEntityConverter {
  @override
  SearchedItemEntity convert(SearchedItemScheme input) {
    return SearchedItemEntity(
      query: input.query,
      requestedAt: input.requestedAt,
    );
  }
}
