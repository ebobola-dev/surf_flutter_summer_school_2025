import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';

abstract interface class IPlacesDatabase {
  Future<void> create(CachedPlaceScheme place);
  Future<void> createOrUpdate(CachedPlaceScheme place);
  Future<void> update(CachedPlaceScheme place);
  Future<void> delete(int placeId);
  Future<bool> exists(int placeId);
  Future<List<CachedPlaceScheme>> get();
  Future<CachedPlaceScheme?> getOne(int placeId);

  Stream<List<CachedPlaceScheme>> get placesStream;
}
