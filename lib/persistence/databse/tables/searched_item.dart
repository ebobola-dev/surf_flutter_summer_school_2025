import 'package:drift/drift.dart';

@DataClassName('SearchedItemSchema')
class SearchedItemsTable extends Table {
  TextColumn get query => text()();

  DateTimeColumn get requestedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {query};
}
