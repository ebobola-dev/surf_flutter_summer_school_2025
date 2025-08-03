// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_database.dart';

// ignore_for_file: type=lint
class $CachedPlaceTypesTableTable extends CachedPlaceTypesTable
    with TableInfo<$CachedPlaceTypesTableTable, CachedPlaceTypeSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPlaceTypesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_place_types_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedPlaceTypeSchema> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  CachedPlaceTypeSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPlaceTypeSchema(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CachedPlaceTypesTableTable createAlias(String alias) {
    return $CachedPlaceTypesTableTable(attachedDatabase, alias);
  }
}

class CachedPlaceTypeSchema extends DataClass
    implements Insertable<CachedPlaceTypeSchema> {
  final String name;
  const CachedPlaceTypeSchema({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  CachedPlaceTypesTableCompanion toCompanion(bool nullToAbsent) {
    return CachedPlaceTypesTableCompanion(name: Value(name));
  }

  factory CachedPlaceTypeSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPlaceTypeSchema(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'name': serializer.toJson<String>(name)};
  }

  CachedPlaceTypeSchema copyWith({String? name}) =>
      CachedPlaceTypeSchema(name: name ?? this.name);
  CachedPlaceTypeSchema copyWithCompanion(CachedPlaceTypesTableCompanion data) {
    return CachedPlaceTypeSchema(
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPlaceTypeSchema(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPlaceTypeSchema && other.name == this.name);
}

class CachedPlaceTypesTableCompanion
    extends UpdateCompanion<CachedPlaceTypeSchema> {
  final Value<String> name;
  final Value<int> rowid;
  const CachedPlaceTypesTableCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedPlaceTypesTableCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CachedPlaceTypeSchema> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedPlaceTypesTableCompanion copyWith({
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return CachedPlaceTypesTableCompanion(
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPlaceTypesTableCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedPlacesTableTable extends CachedPlacesTable
    with TableInfo<$CachedPlacesTableTable, CachedPlaceSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedPlacesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlsMeta = const VerificationMeta(
    'imageUrls',
  );
  @override
  late final GeneratedColumn<String> imageUrls = GeneratedColumn<String>(
    'image_urls',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeTypeNameMeta = const VerificationMeta(
    'placeTypeName',
  );
  @override
  late final GeneratedColumn<String> placeTypeName = GeneratedColumn<String>(
    'place_type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_place_types_table (name)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    imageUrls,
    lat,
    lon,
    placeTypeName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_places_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedPlaceSchema> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_urls')) {
      context.handle(
        _imageUrlsMeta,
        imageUrls.isAcceptableOrUnknown(data['image_urls']!, _imageUrlsMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlsMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('place_type_name')) {
      context.handle(
        _placeTypeNameMeta,
        placeTypeName.isAcceptableOrUnknown(
          data['place_type_name']!,
          _placeTypeNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_placeTypeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedPlaceSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedPlaceSchema(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imageUrls: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_urls'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
      placeTypeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_type_name'],
      )!,
    );
  }

  @override
  $CachedPlacesTableTable createAlias(String alias) {
    return $CachedPlacesTableTable(attachedDatabase, alias);
  }
}

class CachedPlaceSchema extends DataClass
    implements Insertable<CachedPlaceSchema> {
  final int id;
  final String name;
  final String description;
  final String imageUrls;
  final double lat;
  final double lon;
  final String placeTypeName;
  const CachedPlaceSchema({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.lat,
    required this.lon,
    required this.placeTypeName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image_urls'] = Variable<String>(imageUrls);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['place_type_name'] = Variable<String>(placeTypeName);
    return map;
  }

  CachedPlacesTableCompanion toCompanion(bool nullToAbsent) {
    return CachedPlacesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      imageUrls: Value(imageUrls),
      lat: Value(lat),
      lon: Value(lon),
      placeTypeName: Value(placeTypeName),
    );
  }

  factory CachedPlaceSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedPlaceSchema(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      imageUrls: serializer.fromJson<String>(json['imageUrls']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      placeTypeName: serializer.fromJson<String>(json['placeTypeName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'imageUrls': serializer.toJson<String>(imageUrls),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'placeTypeName': serializer.toJson<String>(placeTypeName),
    };
  }

  CachedPlaceSchema copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrls,
    double? lat,
    double? lon,
    String? placeTypeName,
  }) => CachedPlaceSchema(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    imageUrls: imageUrls ?? this.imageUrls,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    placeTypeName: placeTypeName ?? this.placeTypeName,
  );
  CachedPlaceSchema copyWithCompanion(CachedPlacesTableCompanion data) {
    return CachedPlaceSchema(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      imageUrls: data.imageUrls.present ? data.imageUrls.value : this.imageUrls,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      placeTypeName: data.placeTypeName.present
          ? data.placeTypeName.value
          : this.placeTypeName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedPlaceSchema(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrls: $imageUrls, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('placeTypeName: $placeTypeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, imageUrls, lat, lon, placeTypeName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedPlaceSchema &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrls == this.imageUrls &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.placeTypeName == this.placeTypeName);
}

class CachedPlacesTableCompanion extends UpdateCompanion<CachedPlaceSchema> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> imageUrls;
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> placeTypeName;
  const CachedPlacesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrls = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.placeTypeName = const Value.absent(),
  });
  CachedPlacesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String imageUrls,
    required double lat,
    required double lon,
    required String placeTypeName,
  }) : name = Value(name),
       description = Value(description),
       imageUrls = Value(imageUrls),
       lat = Value(lat),
       lon = Value(lon),
       placeTypeName = Value(placeTypeName);
  static Insertable<CachedPlaceSchema> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imageUrls,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<String>? placeTypeName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrls != null) 'image_urls': imageUrls,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (placeTypeName != null) 'place_type_name': placeTypeName,
    });
  }

  CachedPlacesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? imageUrls,
    Value<double>? lat,
    Value<double>? lon,
    Value<String>? placeTypeName,
  }) {
    return CachedPlacesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      placeTypeName: placeTypeName ?? this.placeTypeName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrls.present) {
      map['image_urls'] = Variable<String>(imageUrls.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (placeTypeName.present) {
      map['place_type_name'] = Variable<String>(placeTypeName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedPlacesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrls: $imageUrls, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('placeTypeName: $placeTypeName')
          ..write(')'))
        .toString();
  }
}

abstract class _$CachedDatabase extends GeneratedDatabase {
  _$CachedDatabase(QueryExecutor e) : super(e);
  $CachedDatabaseManager get managers => $CachedDatabaseManager(this);
  late final $CachedPlaceTypesTableTable cachedPlaceTypesTable =
      $CachedPlaceTypesTableTable(this);
  late final $CachedPlacesTableTable cachedPlacesTable =
      $CachedPlacesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedPlaceTypesTable,
    cachedPlacesTable,
  ];
}

typedef $$CachedPlaceTypesTableTableCreateCompanionBuilder =
    CachedPlaceTypesTableCompanion Function({
      required String name,
      Value<int> rowid,
    });
typedef $$CachedPlaceTypesTableTableUpdateCompanionBuilder =
    CachedPlaceTypesTableCompanion Function({
      Value<String> name,
      Value<int> rowid,
    });

final class $$CachedPlaceTypesTableTableReferences
    extends
        BaseReferences<
          _$CachedDatabase,
          $CachedPlaceTypesTableTable,
          CachedPlaceTypeSchema
        > {
  $$CachedPlaceTypesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$CachedPlacesTableTable, List<CachedPlaceSchema>>
  _cachedPlacesTableRefsTable(_$CachedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cachedPlacesTable,
        aliasName: $_aliasNameGenerator(
          db.cachedPlaceTypesTable.name,
          db.cachedPlacesTable.placeTypeName,
        ),
      );

  $$CachedPlacesTableTableProcessedTableManager get cachedPlacesTableRefs {
    final manager =
        $$CachedPlacesTableTableTableManager(
          $_db,
          $_db.cachedPlacesTable,
        ).filter(
          (f) => f.placeTypeName.name.sqlEquals($_itemColumn<String>('name')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _cachedPlacesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedPlaceTypesTableTableFilterComposer
    extends Composer<_$CachedDatabase, $CachedPlaceTypesTableTable> {
  $$CachedPlaceTypesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cachedPlacesTableRefs(
    Expression<bool> Function($$CachedPlacesTableTableFilterComposer f) f,
  ) {
    final $$CachedPlacesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.cachedPlacesTable,
      getReferencedColumn: (t) => t.placeTypeName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedPlacesTableTableFilterComposer(
            $db: $db,
            $table: $db.cachedPlacesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedPlaceTypesTableTableOrderingComposer
    extends Composer<_$CachedDatabase, $CachedPlaceTypesTableTable> {
  $$CachedPlaceTypesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedPlaceTypesTableTableAnnotationComposer
    extends Composer<_$CachedDatabase, $CachedPlaceTypesTableTable> {
  $$CachedPlaceTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> cachedPlacesTableRefs<T extends Object>(
    Expression<T> Function($$CachedPlacesTableTableAnnotationComposer a) f,
  ) {
    final $$CachedPlacesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.name,
          referencedTable: $db.cachedPlacesTable,
          getReferencedColumn: (t) => t.placeTypeName,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedPlacesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedPlacesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CachedPlaceTypesTableTableTableManager
    extends
        RootTableManager<
          _$CachedDatabase,
          $CachedPlaceTypesTableTable,
          CachedPlaceTypeSchema,
          $$CachedPlaceTypesTableTableFilterComposer,
          $$CachedPlaceTypesTableTableOrderingComposer,
          $$CachedPlaceTypesTableTableAnnotationComposer,
          $$CachedPlaceTypesTableTableCreateCompanionBuilder,
          $$CachedPlaceTypesTableTableUpdateCompanionBuilder,
          (CachedPlaceTypeSchema, $$CachedPlaceTypesTableTableReferences),
          CachedPlaceTypeSchema,
          PrefetchHooks Function({bool cachedPlacesTableRefs})
        > {
  $$CachedPlaceTypesTableTableTableManager(
    _$CachedDatabase db,
    $CachedPlaceTypesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPlaceTypesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedPlaceTypesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedPlaceTypesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedPlaceTypesTableCompanion(name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => CachedPlaceTypesTableCompanion.insert(
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedPlaceTypesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedPlacesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cachedPlacesTableRefs) db.cachedPlacesTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedPlacesTableRefs)
                    await $_getPrefetchedData<
                      CachedPlaceTypeSchema,
                      $CachedPlaceTypesTableTable,
                      CachedPlaceSchema
                    >(
                      currentTable: table,
                      referencedTable: $$CachedPlaceTypesTableTableReferences
                          ._cachedPlacesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CachedPlaceTypesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedPlacesTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.placeTypeName == item.name,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CachedPlaceTypesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$CachedDatabase,
      $CachedPlaceTypesTableTable,
      CachedPlaceTypeSchema,
      $$CachedPlaceTypesTableTableFilterComposer,
      $$CachedPlaceTypesTableTableOrderingComposer,
      $$CachedPlaceTypesTableTableAnnotationComposer,
      $$CachedPlaceTypesTableTableCreateCompanionBuilder,
      $$CachedPlaceTypesTableTableUpdateCompanionBuilder,
      (CachedPlaceTypeSchema, $$CachedPlaceTypesTableTableReferences),
      CachedPlaceTypeSchema,
      PrefetchHooks Function({bool cachedPlacesTableRefs})
    >;
typedef $$CachedPlacesTableTableCreateCompanionBuilder =
    CachedPlacesTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String imageUrls,
      required double lat,
      required double lon,
      required String placeTypeName,
    });
typedef $$CachedPlacesTableTableUpdateCompanionBuilder =
    CachedPlacesTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> imageUrls,
      Value<double> lat,
      Value<double> lon,
      Value<String> placeTypeName,
    });

final class $$CachedPlacesTableTableReferences
    extends
        BaseReferences<
          _$CachedDatabase,
          $CachedPlacesTableTable,
          CachedPlaceSchema
        > {
  $$CachedPlacesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedPlaceTypesTableTable _placeTypeNameTable(_$CachedDatabase db) =>
      db.cachedPlaceTypesTable.createAlias(
        $_aliasNameGenerator(
          db.cachedPlacesTable.placeTypeName,
          db.cachedPlaceTypesTable.name,
        ),
      );

  $$CachedPlaceTypesTableTableProcessedTableManager get placeTypeName {
    final $_column = $_itemColumn<String>('place_type_name')!;

    final manager = $$CachedPlaceTypesTableTableTableManager(
      $_db,
      $_db.cachedPlaceTypesTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeTypeNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CachedPlacesTableTableFilterComposer
    extends Composer<_$CachedDatabase, $CachedPlacesTableTable> {
  $$CachedPlacesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrls => $composableBuilder(
    column: $table.imageUrls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedPlaceTypesTableTableFilterComposer get placeTypeName {
    final $$CachedPlaceTypesTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.placeTypeName,
          referencedTable: $db.cachedPlaceTypesTable,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedPlaceTypesTableTableFilterComposer(
                $db: $db,
                $table: $db.cachedPlaceTypesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CachedPlacesTableTableOrderingComposer
    extends Composer<_$CachedDatabase, $CachedPlacesTableTable> {
  $$CachedPlacesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrls => $composableBuilder(
    column: $table.imageUrls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedPlaceTypesTableTableOrderingComposer get placeTypeName {
    final $$CachedPlaceTypesTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.placeTypeName,
          referencedTable: $db.cachedPlaceTypesTable,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedPlaceTypesTableTableOrderingComposer(
                $db: $db,
                $table: $db.cachedPlaceTypesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CachedPlacesTableTableAnnotationComposer
    extends Composer<_$CachedDatabase, $CachedPlacesTableTable> {
  $$CachedPlacesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrls =>
      $composableBuilder(column: $table.imageUrls, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  $$CachedPlaceTypesTableTableAnnotationComposer get placeTypeName {
    final $$CachedPlaceTypesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.placeTypeName,
          referencedTable: $db.cachedPlaceTypesTable,
          getReferencedColumn: (t) => t.name,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedPlaceTypesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedPlaceTypesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CachedPlacesTableTableTableManager
    extends
        RootTableManager<
          _$CachedDatabase,
          $CachedPlacesTableTable,
          CachedPlaceSchema,
          $$CachedPlacesTableTableFilterComposer,
          $$CachedPlacesTableTableOrderingComposer,
          $$CachedPlacesTableTableAnnotationComposer,
          $$CachedPlacesTableTableCreateCompanionBuilder,
          $$CachedPlacesTableTableUpdateCompanionBuilder,
          (CachedPlaceSchema, $$CachedPlacesTableTableReferences),
          CachedPlaceSchema,
          PrefetchHooks Function({bool placeTypeName})
        > {
  $$CachedPlacesTableTableTableManager(
    _$CachedDatabase db,
    $CachedPlacesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedPlacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedPlacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedPlacesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imageUrls = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<String> placeTypeName = const Value.absent(),
              }) => CachedPlacesTableCompanion(
                id: id,
                name: name,
                description: description,
                imageUrls: imageUrls,
                lat: lat,
                lon: lon,
                placeTypeName: placeTypeName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String imageUrls,
                required double lat,
                required double lon,
                required String placeTypeName,
              }) => CachedPlacesTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                imageUrls: imageUrls,
                lat: lat,
                lon: lon,
                placeTypeName: placeTypeName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedPlacesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeTypeName = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (placeTypeName) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeTypeName,
                                referencedTable:
                                    $$CachedPlacesTableTableReferences
                                        ._placeTypeNameTable(db),
                                referencedColumn:
                                    $$CachedPlacesTableTableReferences
                                        ._placeTypeNameTable(db)
                                        .name,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CachedPlacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$CachedDatabase,
      $CachedPlacesTableTable,
      CachedPlaceSchema,
      $$CachedPlacesTableTableFilterComposer,
      $$CachedPlacesTableTableOrderingComposer,
      $$CachedPlacesTableTableAnnotationComposer,
      $$CachedPlacesTableTableCreateCompanionBuilder,
      $$CachedPlacesTableTableUpdateCompanionBuilder,
      (CachedPlaceSchema, $$CachedPlacesTableTableReferences),
      CachedPlaceSchema,
      PrefetchHooks Function({bool placeTypeName})
    >;

class $CachedDatabaseManager {
  final _$CachedDatabase _db;
  $CachedDatabaseManager(this._db);
  $$CachedPlaceTypesTableTableTableManager get cachedPlaceTypesTable =>
      $$CachedPlaceTypesTableTableTableManager(_db, _db.cachedPlaceTypesTable);
  $$CachedPlacesTableTableTableManager get cachedPlacesTable =>
      $$CachedPlacesTableTableTableManager(_db, _db.cachedPlacesTable);
}
