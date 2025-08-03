import 'package:drift/drift.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/place.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/place_type.dart';

@DataClassName('FavoritePlaceScheme')
class FavoritePlacesTable extends Table {
  IntColumn get placeId => integer().references(
    PlacesTable,
    #id,
    onDelete: KeyAction.cascade,
  )();

  DateTimeColumn get likedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {placeId};
}

abstract class FavoritePlacesView extends View {
  PlaceTypesTable get placeTypesTable;
  PlacesTable get placesTable;
  FavoritePlacesTable get favoritePlacesTable;

  @override
  Query<HasResultSet, dynamic> as() =>
      select([
        favoritePlacesTable.placeId,
        favoritePlacesTable.likedAt,
        placesTable.id,
        placesTable.name,
        placesTable.description,
        placesTable.imageUrls,
        placesTable.lat,
        placesTable.lon,
        placesTable.placeTypeName,
      ]).from(favoritePlacesTable).join([
        innerJoin(placesTable, placesTable.id.equalsExp(favoritePlacesTable.placeId)),
      ]);
}
