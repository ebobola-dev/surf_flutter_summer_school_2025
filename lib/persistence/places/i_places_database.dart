import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';

abstract interface class IPlacesDatabase {
  Future<CachedPlaceViewData> create(CachedPlaceSchema place);
  Future<void> update(CachedPlaceSchema place);
  Future<void> delete(int placeId);
  Future<bool> exists(int placeId);
  Future<List<CachedPlaceViewData>> get(int limit, {int? offset});
  Future<CachedPlaceViewData?> getOne(int placeId);

  Stream<List<CachedPlaceViewData>> get placesStream;
}
