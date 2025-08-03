import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';

abstract interface class IPlacesDatabase {
  Future<void> create(CachedPlaceSchema place);
  Future<void> createOrUpdate(CachedPlaceSchema place);
  Future<void> update(CachedPlaceSchema place);
  Future<void> delete(int placeId);
  Future<bool> exists(int placeId);
  Future<List<CachedPlaceSchema>> get();
  Future<CachedPlaceSchema?> getOne(int placeId);

  Stream<List<CachedPlaceSchema>> get placesStream;
}
