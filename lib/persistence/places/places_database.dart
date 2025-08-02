import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/database/not_found.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/places/i_places_database.dart';

class PlacesDatabase implements IPlacesDatabase {
  final CachedDatabase database;
  const PlacesDatabase(this.database);

  @override
  Future<CachedPlaceViewData> create(CachedPlaceSchema place) async {
    await database.into(database.cachedPlacesTable).insert(place);

    return (database.select(database.cachedPlaceView)..where((v) => v.id.equals(place.id))).getSingle();
  }

  @override
  Future<void> update(CachedPlaceSchema place) async {
    await (database.update(
      database.cachedPlacesTable,
    )..where((p) => p.id.equals(place.id))).write(place);
  }

  @override
  Future<void> delete(int placeId) async {
    final query = database.delete(database.cachedPlacesTable)
      ..where(
        (place) => place.id.equals(placeId),
      );
    final deletedCount = await query.go();
    if (deletedCount == 0) {
      throw RecordNotFound(
        tableName: 'PlacesTable',
        message: 'Trying to delete place with id [$placeId], record not found',
      );
    }
  }

  @override
  Future<bool> exists(int placeId) async {
    final result = await (database.select(
      database.cachedPlacesTable,
    )..where((place) => place.id.equals(placeId))).getSingleOrNull();
    return result != null;
  }

  @override
  Future<List<CachedPlaceViewData>> get(int limit, {int? offset}) async {
    return (database.select(database.cachedPlaceView)..limit(limit, offset: offset)).get();
  }

  @override
  Future<CachedPlaceViewData?> getOne(int placeId) async {
    return (database.select(
      database.cachedPlaceView,
    )..where((place) => place.id.equals(placeId))).getSingleOrNull();
  }

  @override
  Stream<List<CachedPlaceViewData>> get placesStream => database.select(database.cachedPlaceView).watch();
}
