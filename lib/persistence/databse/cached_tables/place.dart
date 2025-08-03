import 'package:drift/drift.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_tables/place_type.dart';

@DataClassName('CachedPlaceSchema')
class CachedPlacesTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  TextColumn get description => text()();

  TextColumn get imageUrls => text()();

  RealColumn get lat => real()();
  RealColumn get lon => real()();

  TextColumn get placeTypeName => text().references(CachedPlaceTypesTable, #name)();

  @override
  Set<Column> get primaryKey => {id};
}
