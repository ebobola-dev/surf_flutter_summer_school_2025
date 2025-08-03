import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_tables/place.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_tables/place_type.dart';

part 'cached_database.g.dart';

@DriftDatabase(
  tables: [
    CachedPlaceTypesTable,
    CachedPlacesTable,
  ],
  views: [],
)
class CachedDatabase extends _$CachedDatabase {
  CachedDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'cached_database',
      native: const DriftNativeOptions(
        databaseDirectory: getTemporaryDirectory,
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
    // Дефолтные типы мест
    // Разумеется никакие entity сюда не импортируем так как изоляция все дела
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

    // Получаем все места из бд
    final existingPlaceTypes = (await select(cachedPlaceTypesTable).get()).map((pt) => pt.name);

    // Генерируем запросы на создание мест, которых нет в бд
    final batchInsert = defaultPlaceTypes
        .where((ptName) => !existingPlaceTypes.contains(ptName))
        .map((ptName) => CachedPlaceTypesTableCompanion.insert(name: ptName));

    // Если нет несуществующих, ливаем
    if (batchInsert.isEmpty) return;

    // Выполняем сгенерированные запросы
    await batch((batch) {
      batch.insertAll(cachedPlaceTypesTable, batchInsert);
    });
  }
}
