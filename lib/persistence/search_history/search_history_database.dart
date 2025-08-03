import 'package:drift/drift.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/database/not_found.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/search_history/i_search_history_database.dart';

class SearchHistoryDatabase implements ISearchHistoryDatabase {
  final PersistentDatabase database;

  const SearchHistoryDatabase({
    required this.database,
  });

  @override
  Stream<List<SearchedItemScheme>> get allStream => database.select(database.searchedItemsTable).watch();

  @override
  Future<SearchedItemScheme> createOrUpdate(String query) async {
    await database
        .into(database.searchedItemsTable)
        .insertOnConflictUpdate(
          SearchedItemsTableCompanion(
            query: Value(query),
            requestedAt: Value(DateTime.now().toUtc()),
          ),
        );
    return (database.select(database.searchedItemsTable)..where(
          (i) => i.query.equals(query),
        ))
        .getSingle();
  }

  @override
  Future<List<SearchedItemScheme>> getAll() async {
    return database.select(database.searchedItemsTable).get();
  }

  @override
  Future<void> delete(String query) async {
    final deletedCount =
        await (database.delete(database.searchedItemsTable)..where(
              (i) => i.query.equals(query),
            ))
            .go();
    if (deletedCount == 0) {
      throw RecordNotFound(
        tableName: 'SearchedItemsTable',
        message: 'Trying to delete SearchedItem with query [$query], record not found',
      );
    }
  }

  @override
  Future<int> clear() async {
    return database.delete(database.searchedItemsTable).go();
  }
}
