import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

abstract interface class ISearchHistoryDatabase {
  Future<SearchedItemSchema> createOrUpdate(String query);
  Future<void> delete(String query);
  Future<List<SearchedItemSchema>> getAll();
  Future<int> clear();

  Stream<List<SearchedItemSchema>> get allStream;
}
