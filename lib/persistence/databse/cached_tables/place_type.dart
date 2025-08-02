import 'package:drift/drift.dart';

@DataClassName('CachedPlaceTypeSchema')
class CachedPlaceTypesTable extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
