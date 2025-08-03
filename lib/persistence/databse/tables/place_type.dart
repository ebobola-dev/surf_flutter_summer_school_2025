import 'package:drift/drift.dart';

@DataClassName('PlaceTypeScheme')
class PlaceTypesTable extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
