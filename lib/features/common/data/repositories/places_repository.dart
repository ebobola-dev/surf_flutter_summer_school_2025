import 'package:surf_flutter_summer_school_2025/api/services/places/places_api.dart';
import 'package:surf_flutter_summer_school_2025/core/data/repository/base_repository.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/favorite_place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/persistence/favorite_places/i_favorite_places_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/places/i_places_database.dart';
import 'package:surf_lint_rules/surf_lint_rules.dart';

final class PlacesRepository extends BaseRepository implements IPlacesRepository {
  final PlacesApi _api;
  final IFavoritePlacesDatabase _favoriteDatabase;
  final IPlacesDatabase _placesDatabase;
  // Converters
  final IPlaceDtoToEntityConverter _placeDtoToEntityConverter;
  final IPlaceEntityToSchemaConverter _placeEntityToSchemaConverter;
  final IFavoritePlaceSchemaToEntityConverter _favoritePlaceSchemaToEntityConverter;
  // Cached converters
  final IPlaceEntityAndCachedSchemaConverter _placeEntityAndCachedSchemaConverter;

  const PlacesRepository({
    required super.logWriter,
    required PlacesApi placesApi,
    required IFavoritePlacesDatabase favoritePlaceDatabase,
    required IPlacesDatabase placesDatabase,
    required IPlaceDtoToEntityConverter placeDtoToEntityConverter,
    required IPlaceEntityToSchemaConverter placeEntityToSchemaConverter,
    required IFavoritePlaceSchemaToEntityConverter favoritePlaceSchemaToEntityConverter,
    required IPlaceEntityAndCachedSchemaConverter placeEntityAndCachedSchemaConverter,
  }) : _api = placesApi,
       _favoriteDatabase = favoritePlaceDatabase,
       _placesDatabase = placesDatabase,
       _placeDtoToEntityConverter = placeDtoToEntityConverter,
       _placeEntityToSchemaConverter = placeEntityToSchemaConverter,
       _favoritePlaceSchemaToEntityConverter = favoritePlaceSchemaToEntityConverter,
       _placeEntityAndCachedSchemaConverter = placeEntityAndCachedSchemaConverter;

  @override
  RequestOperation<List<PlaceEntity>> fetchAllPlaces() {
    return makeCall(() async {
      final placeDtos = await _api.fetchAll();
      final placeEntities = _placeDtoToEntityConverter.convertMultiple(placeDtos).toList();
      unawaited(_cachePlaces(placeEntities));
      return placeEntities;
    });
  }

  @override
  RequestOperation<PlaceEntity> fetchOnePlace(int id) {
    return makeCall(() async {
      final placeDto = await _api.fetchOne(id);
      final placeEntity = _placeDtoToEntityConverter.convert(placeDto);
      return placeEntity;
    });
  }

  @override
  RequestOperation<List<FavoritePlaceEntity>> getFavoritePlaces() async {
    return makeCall(() async {
      final result = await _favoriteDatabase.getAll();
      return _favoritePlaceSchemaToEntityConverter.convertMultiple(result).toList();
    });
  }

  @override
  RequestOperation<FavoritePlaceEntity> likePlace(PlaceEntity place) async {
    return makeCall(() async {
      final result = await _favoriteDatabase.create(_placeEntityToSchemaConverter.convert(place));
      return _favoritePlaceSchemaToEntityConverter.convert(result);
    });
  }

  @override
  RequestOperation<void> unlikePlace(int placeId) async {
    return makeCall(() async {
      await _favoriteDatabase.delete(placeId);
    });
  }

  @override
  RequestOperation<bool> isFavorite(int placeId) async {
    return makeCall(() async {
      return _favoriteDatabase.exists(placeId);
    });
  }

  @override
  RequestOperation<FavoritePlaceEntity?> getFavorite(int placeId) async {
    return makeCall(() async {
      final result = await _favoriteDatabase.getOne(placeId);
      return _favoritePlaceSchemaToEntityConverter.convertNullable(result);
    });
  }

  @override
  Stream<List<FavoritePlaceEntity>> get favoritesStream => _favoriteDatabase.favoritesStream.map(
    (favPlaces) => _favoritePlaceSchemaToEntityConverter.convertMultiple(favPlaces).toList(),
  );

  // Cached

  @override
  RequestOperation<List<PlaceEntity>> getAllCachedPlaces() {
    return makeCall(() async {
      final result = await _placesDatabase.get();
      return _placeEntityAndCachedSchemaConverter.reverseConverter.convertMultiple(result).toList();
    });
  }

  Future<void> _cachePlaces(List<PlaceEntity> places) async {
    try {
      await Future.wait(
        places.map(
          (p) => _placesDatabase.createOrUpdate(_placeEntityAndCachedSchemaConverter.convert(p)),
        ),
      );
    } on Exception catch (_) {}
  }
}
