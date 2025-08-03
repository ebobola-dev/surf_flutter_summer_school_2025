import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/disposable_object/i_disposable_object.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/favorite_place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_type_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/repositories/places_repository.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/favorite_places/favorite_places_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/places/places_database.dart';

final class PlacesScope extends DisposableObject implements IPlacesScope {
  @override
  final IPlacesRepository placesRepository;

  PlacesScope({required this.placesRepository});

  factory PlacesScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    final placesApi = PlacesApi(appScope.dio);
    final favoriteDatabase = FavoritePlacesDatabase(appScope.persistentDatabase);
    final placesDatabase = PlacesDatabase(appScope.cachedDatabase);
    // PlaceType converters
    final placeTypeDtoToEntityConverter = PlaceTypeDtoToEntityConverter();
    final placeTypeSchemaToEntityConverter = PlaceTypeSchemaToEntityConverter();
    final cachedPlaceTypeSchemaToEntityConverter = CachedPlaceTypeSchemaToEntityConverter();
    // Place converters
    final placeDtoToEntityConverter = PlaceDtoToEntityConverter(placeTypeConverter: placeTypeDtoToEntityConverter);
    final placeEntityToSchemaConverter = PlaceEntityToSchemaConverter();
    final cachedPlaceSchemaToEntityConverter = CachedPlaceSchemaToEntityConverter(
      cachedPlaceTypeSchemaToEntityConverter: cachedPlaceTypeSchemaToEntityConverter,
    );
    final placeEntityAndCachedSchemaConverter = PlaceEntityAndCachedSchemaConverter(
      cachedPlaceSchemaToEntityConverter: cachedPlaceSchemaToEntityConverter,
    );
    // FavoritePlace converters
    final favoritePlaceSchemaToEntityConverter = FavoritePlaceSchemaToEntityConverter(
      placeTypeSchemaToEntityConverter: placeTypeSchemaToEntityConverter,
    );
    //
    final placesRepository = PlacesRepository(
      logWriter: appScope.logger,
      placesApi: placesApi,
      favoritePlaceDatabase: favoriteDatabase,
      placesDatabase: placesDatabase,
      placeDtoToEntityConverter: placeDtoToEntityConverter,
      placeEntityToSchemaConverter: placeEntityToSchemaConverter,
      favoritePlaceSchemaToEntityConverter: favoritePlaceSchemaToEntityConverter,
      placeEntityAndCachedSchemaConverter: placeEntityAndCachedSchemaConverter,
    );

    return PlacesScope(placesRepository: placesRepository);
  }
}

abstract interface class IPlacesScope implements IDisposableObject {
  IPlacesRepository get placesRepository;
}
