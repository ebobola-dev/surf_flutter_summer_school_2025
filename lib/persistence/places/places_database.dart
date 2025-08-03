import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/database/not_found.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/places/i_places_database.dart';

class PlacesDatabase implements IPlacesDatabase {
  final CachedDatabase database;
  const PlacesDatabase(this.database);

  @override
  Future<void> create(CachedPlaceScheme place) async {
    await database.into(database.cachedPlacesTable).insert(place);
  }

  @override
  Future<void> createOrUpdate(CachedPlaceScheme place) async {
    final result = await (database.select(
      database.cachedPlacesTable,
    )..where((p) => p.id.equals(place.id))).getSingleOrNull();
    if (result == null) {
      await database.into(database.cachedPlacesTable).insert(place);
    } else {
      if (result != place) {
        await database.update(database.cachedPlacesTable).write(place);
      }
    }
  }

  @override
  Future<void> update(CachedPlaceScheme place) async {
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
  Future<List<CachedPlaceScheme>> get() async {
    final result = await database.select(database.cachedPlacesTable).get();
    return result;
  }

  @override
  Future<CachedPlaceScheme?> getOne(int placeId) async {
    return (database.select(
      database.cachedPlacesTable,
    )..where((place) => place.id.equals(placeId))).getSingleOrNull();
  }

  @override
  Stream<List<CachedPlaceScheme>> get placesStream => database.select(database.cachedPlacesTable).watch();
}
