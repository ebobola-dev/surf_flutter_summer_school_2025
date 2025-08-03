import 'package:drift/drift.dart';

@DataClassName('CachedPlaceTypeScheme')
class CachedPlaceTypesTable extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
