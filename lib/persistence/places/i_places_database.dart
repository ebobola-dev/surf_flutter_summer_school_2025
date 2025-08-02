import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';

abstract interface class IPlacesDatabase {
  Future<PlaceViewData> create(PlaceSchema place);
  Future<void> update(PlaceSchema place);
  Future<void> delete(int placeId);
  Future<bool> exists(int placeId);
  Future<List<PlaceViewData>> get(int limit, {int? offset});
  Future<PlaceViewData?> getOne(int placeId);

  Stream<List<PlaceViewData>> get placesStream;
}
