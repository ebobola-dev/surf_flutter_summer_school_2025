import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// Конвертер из [SearchedItemSchema] в [SearchedItemEntity].
typedef ISearchedItemSchemaToEntityConverter = Converter<SearchedItemEntity, SearchedItemSchema>;

/// Реализация [ISearchedItemSchemaToEntityConverter].
final class SearchedItemSchemaToEntityConverter extends ISearchedItemSchemaToEntityConverter {
  @override
  SearchedItemEntity convert(SearchedItemSchema input) {
    return SearchedItemEntity(
      query: input.query,
      requestedAt: input.requestedAt,
    );
  }
}
