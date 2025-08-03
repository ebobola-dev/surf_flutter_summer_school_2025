import 'package:drift/drift.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/place_type.dart';

@DataClassName('PlaceSchema')
class PlacesTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  TextColumn get description => text()();

  TextColumn get imageUrls => text()();

  RealColumn get lat => real()();
  RealColumn get lon => real()();

  TextColumn get placeTypeName => text().references(PlaceTypesTable, #name)();

  @override
  Set<Column> get primaryKey => {id};
}
