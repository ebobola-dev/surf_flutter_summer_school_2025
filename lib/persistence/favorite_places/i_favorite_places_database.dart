import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

abstract interface class IFavoritePlacesDatabase {
  Future<FavoritePlacesViewData> create(PlaceSchema place);
  Future<void> updatePlace(PlaceSchema place);
  Future<void> delete(int placeId);
  Future<bool> exists(int placeId);
  Future<List<FavoritePlacesViewData>> get(int limit, {int? offset});
  Future<FavoritePlacesViewData?> getOne(int placeId);

  Stream<List<FavoritePlacesViewData>> get favoritesStream;
}
