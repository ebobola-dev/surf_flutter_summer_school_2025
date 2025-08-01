import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/failure/database/not_found.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/favorite_places/i_favorite_places_database.dart';

class FavoritePlacesDatabase implements IFavoritePlacesDatabase {
  final PersistentDatabase database;
  const FavoritePlacesDatabase(this.database);

  @override
  Future<FavoritePlacesViewData> create(PlaceSchema place) async {
    await database.into(database.placesTable).insert(place);
    await database
        .into(database.favoritePlacesTable)
        .insert(FavoritePlaceSchema(placeId: place.id, likedAt: DateTime.now().toUtc()));
    return (database.select(database.favoritePlacesView)..where((v) => v.placeId.equals(place.id))).getSingle();
  }

  @override
  Future<void> updatePlace(PlaceSchema place) async {
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
      database.favoritePlacesTable,
    )..where((place) => place.placeId.equals(placeId))).getSingleOrNull();
    return result != null;
  }

  @override
  Future<List<FavoritePlacesViewData>> get(int limit, {int? offset}) async {
    return (database.select(database.favoritePlacesView)..limit(limit, offset: offset)).get();
  }

  @override
  Future<FavoritePlacesViewData?> getOne(int placeId) async {
    return (database.select(
      database.favoritePlacesView,
    )..where((place) => place.placeId.equals(placeId))).getSingleOrNull();
  }

  @override
  Stream<List<FavoritePlacesViewData>> get favoritesStream => database.select(database.favoritePlacesView).watch();
}
