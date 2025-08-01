import 'package:drift/drift.dart';

@DataClassName('PlaceTypeSchema')
class PlaceTypesTable extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
