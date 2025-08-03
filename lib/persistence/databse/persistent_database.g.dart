// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent_database.dart';

// ignore_for_file: type=lint
class $PlaceTypesTableTable extends PlaceTypesTable
    with TableInfo<$PlaceTypesTableTable, PlaceTypeSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaceTypesTableTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'place_types_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceTypeSchema> instance, {
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
  PlaceTypeSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceTypeSchema(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $PlaceTypesTableTable createAlias(String alias) {
    return $PlaceTypesTableTable(attachedDatabase, alias);
  }
}

class PlaceTypeSchema extends DataClass implements Insertable<PlaceTypeSchema> {
  final String name;
  const PlaceTypeSchema({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  PlaceTypesTableCompanion toCompanion(bool nullToAbsent) {
    return PlaceTypesTableCompanion(name: Value(name));
  }

  factory PlaceTypeSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceTypeSchema(name: serializer.fromJson<String>(json['name']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'name': serializer.toJson<String>(name)};
  }

  PlaceTypeSchema copyWith({String? name}) =>
      PlaceTypeSchema(name: name ?? this.name);
  PlaceTypeSchema copyWithCompanion(PlaceTypesTableCompanion data) {
    return PlaceTypeSchema(
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaceTypeSchema(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceTypeSchema && other.name == this.name);
}

class PlaceTypesTableCompanion extends UpdateCompanion<PlaceTypeSchema> {
  final Value<String> name;
  final Value<int> rowid;
  const PlaceTypesTableCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaceTypesTableCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PlaceTypeSchema> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaceTypesTableCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return PlaceTypesTableCompanion(
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
    return (StringBuffer('PlaceTypesTableCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlacesTableTable extends PlacesTable
    with TableInfo<$PlacesTableTable, PlaceSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTableTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES place_types_table (name)',
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
  static const String $name = 'places_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceSchema> instance, {
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
  PlaceSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceSchema(
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
  $PlacesTableTable createAlias(String alias) {
    return $PlacesTableTable(attachedDatabase, alias);
  }
}

class PlaceSchema extends DataClass implements Insertable<PlaceSchema> {
  final int id;
  final String name;
  final String description;
  final String imageUrls;
  final double lat;
  final double lon;
  final String placeTypeName;
  const PlaceSchema({
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

  PlacesTableCompanion toCompanion(bool nullToAbsent) {
    return PlacesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      imageUrls: Value(imageUrls),
      lat: Value(lat),
      lon: Value(lon),
      placeTypeName: Value(placeTypeName),
    );
  }

  factory PlaceSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceSchema(
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

  PlaceSchema copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrls,
    double? lat,
    double? lon,
    String? placeTypeName,
  }) => PlaceSchema(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    imageUrls: imageUrls ?? this.imageUrls,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    placeTypeName: placeTypeName ?? this.placeTypeName,
  );
  PlaceSchema copyWithCompanion(PlacesTableCompanion data) {
    return PlaceSchema(
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
    return (StringBuffer('PlaceSchema(')
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
      (other is PlaceSchema &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrls == this.imageUrls &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.placeTypeName == this.placeTypeName);
}

class PlacesTableCompanion extends UpdateCompanion<PlaceSchema> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> imageUrls;
  final Value<double> lat;
  final Value<double> lon;
  final Value<String> placeTypeName;
  const PlacesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrls = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.placeTypeName = const Value.absent(),
  });
  PlacesTableCompanion.insert({
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
  static Insertable<PlaceSchema> custom({
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

  PlacesTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? imageUrls,
    Value<double>? lat,
    Value<double>? lon,
    Value<String>? placeTypeName,
  }) {
    return PlacesTableCompanion(
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
    return (StringBuffer('PlacesTableCompanion(')
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

class $FavoritePlacesTableTable extends FavoritePlacesTable
    with TableInfo<$FavoritePlacesTableTable, FavoritePlaceSchema> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePlacesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _likedAtMeta = const VerificationMeta(
    'likedAt',
  );
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [placeId, likedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_places_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritePlaceSchema> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('liked_at')) {
      context.handle(
        _likedAtMeta,
        likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {placeId};
  @override
  FavoritePlaceSchema map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlaceSchema(
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      )!,
      likedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}liked_at'],
      )!,
    );
  }

  @override
  $FavoritePlacesTableTable createAlias(String alias) {
    return $FavoritePlacesTableTable(attachedDatabase, alias);
  }
}

class FavoritePlaceSchema extends DataClass
    implements Insertable<FavoritePlaceSchema> {
  final int placeId;
  final DateTime likedAt;
  const FavoritePlaceSchema({required this.placeId, required this.likedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['place_id'] = Variable<int>(placeId);
    map['liked_at'] = Variable<DateTime>(likedAt);
    return map;
  }

  FavoritePlacesTableCompanion toCompanion(bool nullToAbsent) {
    return FavoritePlacesTableCompanion(
      placeId: Value(placeId),
      likedAt: Value(likedAt),
    );
  }

  factory FavoritePlaceSchema.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlaceSchema(
      placeId: serializer.fromJson<int>(json['placeId']),
      likedAt: serializer.fromJson<DateTime>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'placeId': serializer.toJson<int>(placeId),
      'likedAt': serializer.toJson<DateTime>(likedAt),
    };
  }

  FavoritePlaceSchema copyWith({int? placeId, DateTime? likedAt}) =>
      FavoritePlaceSchema(
        placeId: placeId ?? this.placeId,
        likedAt: likedAt ?? this.likedAt,
      );
  FavoritePlaceSchema copyWithCompanion(FavoritePlacesTableCompanion data) {
    return FavoritePlaceSchema(
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlaceSchema(')
          ..write('placeId: $placeId, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(placeId, likedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlaceSchema &&
          other.placeId == this.placeId &&
          other.likedAt == this.likedAt);
}

class FavoritePlacesTableCompanion
    extends UpdateCompanion<FavoritePlaceSchema> {
  final Value<int> placeId;
  final Value<DateTime> likedAt;
  const FavoritePlacesTableCompanion({
    this.placeId = const Value.absent(),
    this.likedAt = const Value.absent(),
  });
  FavoritePlacesTableCompanion.insert({
    this.placeId = const Value.absent(),
    this.likedAt = const Value.absent(),
  });
  static Insertable<FavoritePlaceSchema> custom({
    Expression<int>? placeId,
    Expression<DateTime>? likedAt,
  }) {
    return RawValuesInsertable({
      if (placeId != null) 'place_id': placeId,
      if (likedAt != null) 'liked_at': likedAt,
    });
  }

  FavoritePlacesTableCompanion copyWith({
    Value<int>? placeId,
    Value<DateTime>? likedAt,
  }) {
    return FavoritePlacesTableCompanion(
      placeId: placeId ?? this.placeId,
      likedAt: likedAt ?? this.likedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlacesTableCompanion(')
          ..write('placeId: $placeId, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }
}

class FavoritePlacesViewData extends DataClass {
  final int placeId;
  final DateTime likedAt;
  final int id;
  final String name;
  final String description;
  final String imageUrls;
  final double lat;
  final double lon;
  final String placeTypeName;
  const FavoritePlacesViewData({
    required this.placeId,
    required this.likedAt,
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.lat,
    required this.lon,
    required this.placeTypeName,
  });
  factory FavoritePlacesViewData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlacesViewData(
      placeId: serializer.fromJson<int>(json['placeId']),
      likedAt: serializer.fromJson<DateTime>(json['likedAt']),
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
      'placeId': serializer.toJson<int>(placeId),
      'likedAt': serializer.toJson<DateTime>(likedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'imageUrls': serializer.toJson<String>(imageUrls),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'placeTypeName': serializer.toJson<String>(placeTypeName),
    };
  }

  FavoritePlacesViewData copyWith({
    int? placeId,
    DateTime? likedAt,
    int? id,
    String? name,
    String? description,
    String? imageUrls,
    double? lat,
    double? lon,
    String? placeTypeName,
  }) => FavoritePlacesViewData(
    placeId: placeId ?? this.placeId,
    likedAt: likedAt ?? this.likedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    imageUrls: imageUrls ?? this.imageUrls,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    placeTypeName: placeTypeName ?? this.placeTypeName,
  );
  @override
  String toString() {
    return (StringBuffer('FavoritePlacesViewData(')
          ..write('placeId: $placeId, ')
          ..write('likedAt: $likedAt, ')
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
  int get hashCode => Object.hash(
    placeId,
    likedAt,
    id,
    name,
    description,
    imageUrls,
    lat,
    lon,
    placeTypeName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlacesViewData &&
          other.placeId == this.placeId &&
          other.likedAt == this.likedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrls == this.imageUrls &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.placeTypeName == this.placeTypeName);
}

class $FavoritePlacesViewView
    extends ViewInfo<$FavoritePlacesViewView, FavoritePlacesViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$PersistentDatabase attachedDatabase;
  $FavoritePlacesViewView(this.attachedDatabase, [this._alias]);
  $PlaceTypesTableTable get placeTypesTable =>
      attachedDatabase.placeTypesTable.createAlias('t0');
  $PlacesTableTable get placesTable =>
      attachedDatabase.placesTable.createAlias('t1');
  $FavoritePlacesTableTable get favoritePlacesTable =>
      attachedDatabase.favoritePlacesTable.createAlias('t2');
  @override
  List<GeneratedColumn> get $columns => [
    placeId,
    likedAt,
    id,
    name,
    description,
    imageUrls,
    lat,
    lon,
    placeTypeName,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'favorite_places_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $FavoritePlacesViewView get asDslTable => this;
  @override
  FavoritePlacesViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlacesViewData(
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      )!,
      likedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}liked_at'],
      )!,
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

  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(favoritePlacesTable.placeId, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
    'liked_at',
    aliasedName,
    false,
    generatedAs: GeneratedAs(favoritePlacesTable.likedAt, false),
    type: DriftSqlType.dateTime,
  );
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.id, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.name, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.description, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> imageUrls = GeneratedColumn<String>(
    'image_urls',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.imageUrls, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.lat, false),
    type: DriftSqlType.double,
  );
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.lon, false),
    type: DriftSqlType.double,
  );
  late final GeneratedColumn<String> placeTypeName = GeneratedColumn<String>(
    'place_type_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(placesTable.placeTypeName, false),
    type: DriftSqlType.string,
  );
  @override
  $FavoritePlacesViewView createAlias(String alias) {
    return $FavoritePlacesViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(
        favoritePlacesTable,
      )..addColumns($columns)).join([
        innerJoin(
          placesTable,
          placesTable.id.equalsExp(favoritePlacesTable.placeId),
        ),
      ]);
  @override
  Set<String> get readTables => const {
    'place_types_table',
    'places_table',
    'favorite_places_table',
  };
}

abstract class _$PersistentDatabase extends GeneratedDatabase {
  _$PersistentDatabase(QueryExecutor e) : super(e);
  $PersistentDatabaseManager get managers => $PersistentDatabaseManager(this);
  late final $PlaceTypesTableTable placeTypesTable = $PlaceTypesTableTable(
    this,
  );
  late final $PlacesTableTable placesTable = $PlacesTableTable(this);
  late final $FavoritePlacesTableTable favoritePlacesTable =
      $FavoritePlacesTableTable(this);
  late final $FavoritePlacesViewView favoritePlacesView =
      $FavoritePlacesViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    placeTypesTable,
    placesTable,
    favoritePlacesTable,
    favoritePlacesView,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('favorite_places_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PlaceTypesTableTableCreateCompanionBuilder =
    PlaceTypesTableCompanion Function({required String name, Value<int> rowid});
typedef $$PlaceTypesTableTableUpdateCompanionBuilder =
    PlaceTypesTableCompanion Function({Value<String> name, Value<int> rowid});

final class $$PlaceTypesTableTableReferences
    extends
        BaseReferences<
          _$PersistentDatabase,
          $PlaceTypesTableTable,
          PlaceTypeSchema
        > {
  $$PlaceTypesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PlacesTableTable, List<PlaceSchema>>
  _placesTableRefsTable(_$PersistentDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.placesTable,
        aliasName: $_aliasNameGenerator(
          db.placeTypesTable.name,
          db.placesTable.placeTypeName,
        ),
      );

  $$PlacesTableTableProcessedTableManager get placesTableRefs {
    final manager = $$PlacesTableTableTableManager($_db, $_db.placesTable)
        .filter(
          (f) => f.placeTypeName.name.sqlEquals($_itemColumn<String>('name')!),
        );

    final cache = $_typedResult.readTableOrNull(_placesTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlaceTypesTableTableFilterComposer
    extends Composer<_$PersistentDatabase, $PlaceTypesTableTable> {
  $$PlaceTypesTableTableFilterComposer({
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

  Expression<bool> placesTableRefs(
    Expression<bool> Function($$PlacesTableTableFilterComposer f) f,
  ) {
    final $$PlacesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.placesTable,
      getReferencedColumn: (t) => t.placeTypeName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableTableFilterComposer(
            $db: $db,
            $table: $db.placesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaceTypesTableTableOrderingComposer
    extends Composer<_$PersistentDatabase, $PlaceTypesTableTable> {
  $$PlaceTypesTableTableOrderingComposer({
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

class $$PlaceTypesTableTableAnnotationComposer
    extends Composer<_$PersistentDatabase, $PlaceTypesTableTable> {
  $$PlaceTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> placesTableRefs<T extends Object>(
    Expression<T> Function($$PlacesTableTableAnnotationComposer a) f,
  ) {
    final $$PlacesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.name,
      referencedTable: $db.placesTable,
      getReferencedColumn: (t) => t.placeTypeName,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.placesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlaceTypesTableTableTableManager
    extends
        RootTableManager<
          _$PersistentDatabase,
          $PlaceTypesTableTable,
          PlaceTypeSchema,
          $$PlaceTypesTableTableFilterComposer,
          $$PlaceTypesTableTableOrderingComposer,
          $$PlaceTypesTableTableAnnotationComposer,
          $$PlaceTypesTableTableCreateCompanionBuilder,
          $$PlaceTypesTableTableUpdateCompanionBuilder,
          (PlaceTypeSchema, $$PlaceTypesTableTableReferences),
          PlaceTypeSchema,
          PrefetchHooks Function({bool placesTableRefs})
        > {
  $$PlaceTypesTableTableTableManager(
    _$PersistentDatabase db,
    $PlaceTypesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaceTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaceTypesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaceTypesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaceTypesTableCompanion(name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => PlaceTypesTableCompanion.insert(name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaceTypesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (placesTableRefs) db.placesTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (placesTableRefs)
                    await $_getPrefetchedData<
                      PlaceTypeSchema,
                      $PlaceTypesTableTable,
                      PlaceSchema
                    >(
                      currentTable: table,
                      referencedTable: $$PlaceTypesTableTableReferences
                          ._placesTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PlaceTypesTableTableReferences(
                            db,
                            table,
                            p0,
                          ).placesTableRefs,
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

typedef $$PlaceTypesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PersistentDatabase,
      $PlaceTypesTableTable,
      PlaceTypeSchema,
      $$PlaceTypesTableTableFilterComposer,
      $$PlaceTypesTableTableOrderingComposer,
      $$PlaceTypesTableTableAnnotationComposer,
      $$PlaceTypesTableTableCreateCompanionBuilder,
      $$PlaceTypesTableTableUpdateCompanionBuilder,
      (PlaceTypeSchema, $$PlaceTypesTableTableReferences),
      PlaceTypeSchema,
      PrefetchHooks Function({bool placesTableRefs})
    >;
typedef $$PlacesTableTableCreateCompanionBuilder =
    PlacesTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String imageUrls,
      required double lat,
      required double lon,
      required String placeTypeName,
    });
typedef $$PlacesTableTableUpdateCompanionBuilder =
    PlacesTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> imageUrls,
      Value<double> lat,
      Value<double> lon,
      Value<String> placeTypeName,
    });

final class $$PlacesTableTableReferences
    extends
        BaseReferences<_$PersistentDatabase, $PlacesTableTable, PlaceSchema> {
  $$PlacesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlaceTypesTableTable _placeTypeNameTable(_$PersistentDatabase db) =>
      db.placeTypesTable.createAlias(
        $_aliasNameGenerator(
          db.placesTable.placeTypeName,
          db.placeTypesTable.name,
        ),
      );

  $$PlaceTypesTableTableProcessedTableManager get placeTypeName {
    final $_column = $_itemColumn<String>('place_type_name')!;

    final manager = $$PlaceTypesTableTableTableManager(
      $_db,
      $_db.placeTypesTable,
    ).filter((f) => f.name.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeTypeNameTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $FavoritePlacesTableTable,
    List<FavoritePlaceSchema>
  >
  _favoritePlacesTableRefsTable(_$PersistentDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.favoritePlacesTable,
        aliasName: $_aliasNameGenerator(
          db.placesTable.id,
          db.favoritePlacesTable.placeId,
        ),
      );

  $$FavoritePlacesTableTableProcessedTableManager get favoritePlacesTableRefs {
    final manager = $$FavoritePlacesTableTableTableManager(
      $_db,
      $_db.favoritePlacesTable,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _favoritePlacesTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlacesTableTableFilterComposer
    extends Composer<_$PersistentDatabase, $PlacesTableTable> {
  $$PlacesTableTableFilterComposer({
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

  $$PlaceTypesTableTableFilterComposer get placeTypeName {
    final $$PlaceTypesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeTypeName,
      referencedTable: $db.placeTypesTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceTypesTableTableFilterComposer(
            $db: $db,
            $table: $db.placeTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> favoritePlacesTableRefs(
    Expression<bool> Function($$FavoritePlacesTableTableFilterComposer f) f,
  ) {
    final $$FavoritePlacesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoritePlacesTable,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritePlacesTableTableFilterComposer(
            $db: $db,
            $table: $db.favoritePlacesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableTableOrderingComposer
    extends Composer<_$PersistentDatabase, $PlacesTableTable> {
  $$PlacesTableTableOrderingComposer({
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

  $$PlaceTypesTableTableOrderingComposer get placeTypeName {
    final $$PlaceTypesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeTypeName,
      referencedTable: $db.placeTypesTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceTypesTableTableOrderingComposer(
            $db: $db,
            $table: $db.placeTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlacesTableTableAnnotationComposer
    extends Composer<_$PersistentDatabase, $PlacesTableTable> {
  $$PlacesTableTableAnnotationComposer({
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

  $$PlaceTypesTableTableAnnotationComposer get placeTypeName {
    final $$PlaceTypesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeTypeName,
      referencedTable: $db.placeTypesTable,
      getReferencedColumn: (t) => t.name,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceTypesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.placeTypesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> favoritePlacesTableRefs<T extends Object>(
    Expression<T> Function($$FavoritePlacesTableTableAnnotationComposer a) f,
  ) {
    final $$FavoritePlacesTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.favoritePlacesTable,
          getReferencedColumn: (t) => t.placeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FavoritePlacesTableTableAnnotationComposer(
                $db: $db,
                $table: $db.favoritePlacesTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PlacesTableTableTableManager
    extends
        RootTableManager<
          _$PersistentDatabase,
          $PlacesTableTable,
          PlaceSchema,
          $$PlacesTableTableFilterComposer,
          $$PlacesTableTableOrderingComposer,
          $$PlacesTableTableAnnotationComposer,
          $$PlacesTableTableCreateCompanionBuilder,
          $$PlacesTableTableUpdateCompanionBuilder,
          (PlaceSchema, $$PlacesTableTableReferences),
          PlaceSchema,
          PrefetchHooks Function({
            bool placeTypeName,
            bool favoritePlacesTableRefs,
          })
        > {
  $$PlacesTableTableTableManager(
    _$PersistentDatabase db,
    $PlacesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imageUrls = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<String> placeTypeName = const Value.absent(),
              }) => PlacesTableCompanion(
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
              }) => PlacesTableCompanion.insert(
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
                  $$PlacesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({placeTypeName = false, favoritePlacesTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (favoritePlacesTableRefs) db.favoritePlacesTable,
                  ],
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
                                        $$PlacesTableTableReferences
                                            ._placeTypeNameTable(db),
                                    referencedColumn:
                                        $$PlacesTableTableReferences
                                            ._placeTypeNameTable(db)
                                            .name,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (favoritePlacesTableRefs)
                        await $_getPrefetchedData<
                          PlaceSchema,
                          $PlacesTableTable,
                          FavoritePlaceSchema
                        >(
                          currentTable: table,
                          referencedTable: $$PlacesTableTableReferences
                              ._favoritePlacesTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlacesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritePlacesTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.placeId == item.id,
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

typedef $$PlacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PersistentDatabase,
      $PlacesTableTable,
      PlaceSchema,
      $$PlacesTableTableFilterComposer,
      $$PlacesTableTableOrderingComposer,
      $$PlacesTableTableAnnotationComposer,
      $$PlacesTableTableCreateCompanionBuilder,
      $$PlacesTableTableUpdateCompanionBuilder,
      (PlaceSchema, $$PlacesTableTableReferences),
      PlaceSchema,
      PrefetchHooks Function({bool placeTypeName, bool favoritePlacesTableRefs})
    >;
typedef $$FavoritePlacesTableTableCreateCompanionBuilder =
    FavoritePlacesTableCompanion Function({
      Value<int> placeId,
      Value<DateTime> likedAt,
    });
typedef $$FavoritePlacesTableTableUpdateCompanionBuilder =
    FavoritePlacesTableCompanion Function({
      Value<int> placeId,
      Value<DateTime> likedAt,
    });

final class $$FavoritePlacesTableTableReferences
    extends
        BaseReferences<
          _$PersistentDatabase,
          $FavoritePlacesTableTable,
          FavoritePlaceSchema
        > {
  $$FavoritePlacesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlacesTableTable _placeIdTable(_$PersistentDatabase db) =>
      db.placesTable.createAlias(
        $_aliasNameGenerator(db.favoritePlacesTable.placeId, db.placesTable.id),
      );

  $$PlacesTableTableProcessedTableManager get placeId {
    final $_column = $_itemColumn<int>('place_id')!;

    final manager = $$PlacesTableTableTableManager(
      $_db,
      $_db.placesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritePlacesTableTableFilterComposer
    extends Composer<_$PersistentDatabase, $FavoritePlacesTableTable> {
  $$FavoritePlacesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlacesTableTableFilterComposer get placeId {
    final $$PlacesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.placesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableTableFilterComposer(
            $db: $db,
            $table: $db.placesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlacesTableTableOrderingComposer
    extends Composer<_$PersistentDatabase, $FavoritePlacesTableTable> {
  $$FavoritePlacesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
    column: $table.likedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlacesTableTableOrderingComposer get placeId {
    final $$PlacesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.placesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableTableOrderingComposer(
            $db: $db,
            $table: $db.placesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlacesTableTableAnnotationComposer
    extends Composer<_$PersistentDatabase, $FavoritePlacesTableTable> {
  $$FavoritePlacesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);

  $$PlacesTableTableAnnotationComposer get placeId {
    final $$PlacesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.placesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.placesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritePlacesTableTableTableManager
    extends
        RootTableManager<
          _$PersistentDatabase,
          $FavoritePlacesTableTable,
          FavoritePlaceSchema,
          $$FavoritePlacesTableTableFilterComposer,
          $$FavoritePlacesTableTableOrderingComposer,
          $$FavoritePlacesTableTableAnnotationComposer,
          $$FavoritePlacesTableTableCreateCompanionBuilder,
          $$FavoritePlacesTableTableUpdateCompanionBuilder,
          (FavoritePlaceSchema, $$FavoritePlacesTableTableReferences),
          FavoritePlaceSchema,
          PrefetchHooks Function({bool placeId})
        > {
  $$FavoritePlacesTableTableTableManager(
    _$PersistentDatabase db,
    $FavoritePlacesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritePlacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritePlacesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoritePlacesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> placeId = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
              }) => FavoritePlacesTableCompanion(
                placeId: placeId,
                likedAt: likedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> placeId = const Value.absent(),
                Value<DateTime> likedAt = const Value.absent(),
              }) => FavoritePlacesTableCompanion.insert(
                placeId: placeId,
                likedAt: likedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoritePlacesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeId = false}) {
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
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable:
                                    $$FavoritePlacesTableTableReferences
                                        ._placeIdTable(db),
                                referencedColumn:
                                    $$FavoritePlacesTableTableReferences
                                        ._placeIdTable(db)
                                        .id,
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

typedef $$FavoritePlacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PersistentDatabase,
      $FavoritePlacesTableTable,
      FavoritePlaceSchema,
      $$FavoritePlacesTableTableFilterComposer,
      $$FavoritePlacesTableTableOrderingComposer,
      $$FavoritePlacesTableTableAnnotationComposer,
      $$FavoritePlacesTableTableCreateCompanionBuilder,
      $$FavoritePlacesTableTableUpdateCompanionBuilder,
      (FavoritePlaceSchema, $$FavoritePlacesTableTableReferences),
      FavoritePlaceSchema,
      PrefetchHooks Function({bool placeId})
    >;

class $PersistentDatabaseManager {
  final _$PersistentDatabase _db;
  $PersistentDatabaseManager(this._db);
  $$PlaceTypesTableTableTableManager get placeTypesTable =>
      $$PlaceTypesTableTableTableManager(_db, _db.placeTypesTable);
  $$PlacesTableTableTableManager get placesTable =>
      $$PlacesTableTableTableManager(_db, _db.placesTable);
  $$FavoritePlacesTableTableTableManager get favoritePlacesTable =>
      $$FavoritePlacesTableTableTableManager(_db, _db.favoritePlacesTable);
}
