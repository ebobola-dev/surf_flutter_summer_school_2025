import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/database/not_found.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/places/i_places_database.dart';

class PlacesDatabase implements IPlacesDatabase {
  final CachedDatabase database;
  const PlacesDatabase(this.database);

  @override
  Future<PlaceViewData> create(PlaceSchema place) async {
    await database.into(database.placesTable).insert(place);

    return (database.select(database.placeView)..where((v) => v.id.equals(place.id))).getSingle();
  }

  @override
  Future<void> update(PlaceSchema place) async {
    await (database.update(
      database.placesTable,
    )..where((p) => p.id.equals(place.id))).write(place);
  }

  @override
  Future<void> delete(int placeId) async {
    final query = database.delete(database.placesTable)
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
      database.placesTable,
    )..where((place) => place.id.equals(placeId))).getSingleOrNull();
    return result != null;
  }

  @override
  Future<List<PlaceViewData>> get(int limit, {int? offset}) async {
    return (database.select(database.placeView)..limit(limit, offset: offset)).get();
  }

  @override
  Future<PlaceViewData?> getOne(int placeId) async {
    return (database.select(
      database.placeView,
    )..where((place) => place.id.equals(placeId))).getSingleOrNull();
  }

  @override
  Stream<List<PlaceViewData>> get placesStream => database.select(database.placeView).watch();
}
