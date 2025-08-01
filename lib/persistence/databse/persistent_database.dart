import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/favorite.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/place.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/tables/place_type.dart';

part 'persistent_database.g.dart';

@DriftDatabase(
  tables: [
    PlaceTypesTable,
    PlacesTable,
    FavoritePlacesTable,
  ],
  views: [
    PlaceView,
    FavoritePlacesView,
  ],
)
class PersistentDatabase extends _$PersistentDatabase {
  PersistentDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'persistent_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await _enableForeignKeys();
        await _initializePlaceTypes();
      },
      beforeOpen: (details) async {
        await _enableForeignKeys();
      },
    );
  }

  Future<void> _enableForeignKeys() async {
    await customStatement('PRAGMA foreign_keys = ON');
  }

  Future<void> _initializePlaceTypes() async {
    const defaultPlaceTypes = <String>{
      'other',
      'park',
      'monument',
      'theatre',
      'museum',
      'temple',
      'hotel',
      'restaurant',
      'cafe',
      'shopping',
    };
    final existingPlaceTypes = (await select(placeTypesTable).get()).map((pt) => pt.name);

    final batchInsert = defaultPlaceTypes
        .where((ptName) => !existingPlaceTypes.contains(ptName))
        .map((ptName) => PlaceTypesTableCompanion.insert(name: ptName));

    await batch((batch) {
      batch.insertAll(placeTypesTable, batchInsert);
    });
  }
}
