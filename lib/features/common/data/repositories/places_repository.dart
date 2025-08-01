import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/core/architecture/data/repository/base_repository.dart';
import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/failure/failure.dart';
import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/result.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/favorite_place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/favorite_places/i_favorite_places_database.dart';

final class PlacesRepository extends BaseRepository implements IPlacesRepository {
  final PlacesApi _api;
  final IFavoritePlacesDatabase _favoriteDatabase;
  final IPlaceDtoToEntityConverter _placeDtoToEntityConverter;
  final IPlaceEntityToSchemaConverter _placeEntityToSchemaConverter;
  final IFavoritePlaceSchemaToEntityConverter _favoritePlaceSchemaToEntityConverter;

  const PlacesRepository({
    required super.logWriter,
    required PlacesApi placesApi,
    required IFavoritePlacesDatabase favoritePlaceDatabase,
    required IPlaceDtoToEntityConverter placeDtoToEntityConverter,
    required IPlaceEntityToSchemaConverter placeEntityToSchemaConverter,
    required IFavoritePlaceSchemaToEntityConverter favoritePlaceSchemaToEntityConverter,
  }) : _api = placesApi,
       _favoriteDatabase = favoritePlaceDatabase,
       _placeDtoToEntityConverter = placeDtoToEntityConverter,
       _placeEntityToSchemaConverter = placeEntityToSchemaConverter,
       _favoritePlaceSchemaToEntityConverter = favoritePlaceSchemaToEntityConverter;

  @override
  RequestOperation<List<PlaceEntity>> fetchAllPlaces() {
    return makeApiCall(() async {
      final placeDtos = await _api.fetchAll();
      final placeEntities = _placeDtoToEntityConverter.convertMultiple(placeDtos).toList();
      return placeEntities;
    });
  }

  @override
  RequestOperation<PlaceEntity> fetchOnePlace(int id) {
    return makeApiCall(() async {
      final placeDto = await _api.fetchOne(id);
      final placeEntity = _placeDtoToEntityConverter.convert(placeDto);
      return placeEntity;
    });
  }

  @override
  RequestOperation<List<PlaceEntity>> search({
    required String query,
    int offset = 0,
    int limit = 10,
  }) {
    return makeApiCall(() async {
      final foundPlaceDtos = await _api.search(
        query: query,
        offset: offset,
        limit: limit,
      );
      final placeDtos = foundPlaceDtos.results.map((fp) => fp.place);
      final placeEntities = _placeDtoToEntityConverter.convertMultiple(placeDtos).toList();
      return placeEntities;
    });
  }

  @override
  RequestOperation<List<FavoritePlaceEntity>> getFavoritePlaces() async {
    try {
      final result = await _favoriteDatabase.get(10);
      return Result.ok(_favoritePlaceSchemaToEntityConverter.convertMultiple(result).toList());
    } on Object catch (error, stackTrace) {
      return Result.failed(Failure(original: error, stackTrace: stackTrace));
    }
  }

  @override
  RequestOperation<FavoritePlaceEntity> likePlace(PlaceEntity place) async {
    try {
      final result = await _favoriteDatabase.create(_placeEntityToSchemaConverter.convert(place));
      return Result.ok(_favoritePlaceSchemaToEntityConverter.convert(result));
    } on Object catch (error, stackTrace) {
      return Result.failed(Failure(original: error, stackTrace: stackTrace));
    }
  }

  @override
  RequestOperation<void> unlikePlace(int placeId) async {
    try {
      await _favoriteDatabase.delete(placeId);
      return Result.ok(null);
    } on Object catch (error, stackTrace) {
      return Result.failed(Failure(original: error, stackTrace: stackTrace));
    }
  }

  @override
  RequestOperation<bool> isFavorite(int placeId) async {
    try {
      return Result.ok(await _favoriteDatabase.exists(placeId));
    } on Object catch (error, stackTrace) {
      return Result.failed(Failure(original: error, stackTrace: stackTrace));
    }
  }

  // @override
  // RequestOperation<FavoritePlaceEntity?> getFavorite(int placeId) async {
  //   try {
  //     final result = await _favoriteDatabase.getOne(placeId);
  //     return Result.ok(_favoritePlaceSchemaToEntityConverter.convertNullable(result));
  //   } on Object catch (error, stackTrace) {
  //     return Result.failed(Failure(original: error, stackTrace: stackTrace));
  //   }
  // }

  @override
  Stream<List<FavoritePlaceEntity>> get favoritesStream => _favoriteDatabase.favoritesStream.map(
    (favPlaces) => _favoritePlaceSchemaToEntityConverter.convertMultiple(favPlaces).toList(),
  );
}
