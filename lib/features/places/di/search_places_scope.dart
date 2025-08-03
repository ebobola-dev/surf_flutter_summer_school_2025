import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/i_disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_type_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/found_place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/search_result_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/converters/searched_item_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/data/repositories/search_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/repositories/i_search_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/search_history/search_history_database.dart';

final class SearchPlacesScope extends DisposableObject implements ISearchPlacesScope {
  @override
  final ISearchPlacesRepository searchPlacesRepository;

  SearchPlacesScope({required this.searchPlacesRepository});

  factory SearchPlacesScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();

    final placesApi = PlacesApi(appScope.dio);

    final searchHistoryDatabase = SearchHistoryDatabase(database: appScope.persistentDatabase);

    final placeTypeDtoToEntityConverter = PlaceTypeDtoToEntityConverter();
    final placeDtoToEntityConverter = PlaceDtoToEntityConverter(
      placeTypeConverter: placeTypeDtoToEntityConverter,
    );
    final foundPlaceDtoToEntityConverter = FoundPlaceDtoToEntityConverter(
      placeDtoToEntityConverter: placeDtoToEntityConverter,
    );
    final searchResultDtoToEntityConverter = SearchResultDtoToEntityConverter(
      foundPlaceDtoToEntityConverter: foundPlaceDtoToEntityConverter,
    );

    final searchedItemSchemaToEntityConverter = SearchedItemSchemaToEntityConverter();

    final placesRepository = SearchPlacesRepository(
      logWriter: appScope.logger,
      placesApi: placesApi,
      searchHistoryDatabase: searchHistoryDatabase,
      searchResultDtoToEntityConverter: searchResultDtoToEntityConverter,
      searchedItemSchemaToEntityConverter: searchedItemSchemaToEntityConverter,
    );

    return SearchPlacesScope(searchPlacesRepository: placesRepository);
  }
}

abstract interface class ISearchPlacesScope implements IDisposableObject {
  ISearchPlacesRepository get searchPlacesRepository;
}
