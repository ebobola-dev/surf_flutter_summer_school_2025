import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:surf_flutter_summer_school_2025/api/places/place_dto.dart';
import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_type_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// Конвертер из [PlaceDto] в [PlaceEntity].
typedef IPlaceDtoToEntityConverter = Converter<PlaceEntity, PlaceDto>;

/// Реализация [IPlaceDtoToEntityConverter].
final class PlaceDtoToEntityConverter extends IPlaceDtoToEntityConverter {
  /// Конвертер для типа места.
  final IPlaceTypeDtoToEntityConverter placeTypeConverter;

  const PlaceDtoToEntityConverter({required this.placeTypeConverter});

  @override
  PlaceEntity convert(PlaceDto input) {
    final placeType = placeTypeConverter.convert(input.placeType);
    return PlaceEntity(
      id: input.id,
      name: input.name,
      description: input.description,
      placeType: placeType,
      imageUrls: input.imageUrls,
      lat: input.lat,
      lon: input.lon,
    );
  }
}

/// Конвертер из [PlaceSchema] в [PlaceEntity].
typedef IPlaceSchemaToEntityConverter = Converter<PlaceEntity, PlaceSchema>;

/// Реализация [IPlaceSchemaToEntityConverter]
final class PlaceSchemaToEntityConverter extends IPlaceSchemaToEntityConverter {
  final IPlaceTypeSchemaToEntityConverter cachedPlaceTypeSchemaToEntityConverter;
  const PlaceSchemaToEntityConverter({
    required this.cachedPlaceTypeSchemaToEntityConverter,
  });

  @override
  PlaceEntity convert(PlaceSchema input) {
    final placeType = cachedPlaceTypeSchemaToEntityConverter.convert(PlaceTypeSchema(name: input.placeTypeName));
    return PlaceEntity(
      id: input.id,
      name: input.name,
      description: input.description,
      imageUrls: List<String>.from(jsonDecode(input.imageUrls) as List<dynamic>),
      lat: input.lat,
      lon: input.lon,
      placeType: placeType,
    );
  }
}

/// Конвертер из [PlaceEntity] в [PlaceSchema].
typedef IPlaceEntityToSchemaConverter = Converter<PlaceSchema, PlaceEntity>;

/// Реализация [IPlaceEntityToSchemaConverter]
final class PlaceEntityToSchemaConverter extends IPlaceEntityToSchemaConverter {
  const PlaceEntityToSchemaConverter();

  @override
  PlaceSchema convert(PlaceEntity input) {
    return PlaceSchema(
      id: input.id,
      name: input.name,
      description: input.description,
      imageUrls: jsonEncode(input.imageUrls),
      lat: input.lat,
      lon: input.lon,
      placeTypeName: input.placeType.name,
    );
  }
}

/// Конвертер [PlaceEntity] <-> [PlaceSchema].
typedef IPlaceEntityAndSchemaConverter = ConverterToAndFrom<PlaceSchema, PlaceEntity>;

/// Реализация [IPlaceEntityAndSchemaConverter]
final class PlaceEntityAndSchemaConverter extends IPlaceEntityAndSchemaConverter {
  final IPlaceSchemaToEntityConverter cachedPlaceSchemaToEntityConverter;
  const PlaceEntityAndSchemaConverter({required this.cachedPlaceSchemaToEntityConverter});

  @override
  Converter<PlaceSchema, PlaceEntity> get converter => const PlaceEntityToSchemaConverter();

  @override
  Converter<PlaceEntity, PlaceSchema> get reverseConverter => cachedPlaceSchemaToEntityConverter;
}

// % Cached
/// Конвертер из [CachedPlaceSchema] в [PlaceEntity].
typedef ICachedPlaceSchemaToEntityConverter = Converter<PlaceEntity, CachedPlaceSchema>;

/// Реализация [ICachedPlaceSchemaToEntityConverter]
final class CachedPlaceSchemaToEntityConverter extends ICachedPlaceSchemaToEntityConverter {
  final ICachedPlaceTypeSchemaToEntityConverter cachedPlaceTypeSchemaToEntityConverter;
  const CachedPlaceSchemaToEntityConverter({
    required this.cachedPlaceTypeSchemaToEntityConverter,
  });

  @override
  PlaceEntity convert(CachedPlaceSchema input) {
    final placeType = cachedPlaceTypeSchemaToEntityConverter.convert(CachedPlaceTypeSchema(name: input.placeTypeName));
    return PlaceEntity(
      id: input.id,
      name: input.name,
      description: input.description,
      imageUrls: List<String>.from(jsonDecode(input.imageUrls) as List<dynamic>),
      lat: input.lat,
      lon: input.lon,
      placeType: placeType,
    );
  }
}

/// Конвертер из [PlaceEntity] в [CachedPlaceSchema].
typedef IPlaceEntityToCachedSchemaConverter = Converter<CachedPlaceSchema, PlaceEntity>;

/// Реализация [IPlaceEntityToCachedSchemaConverter]
final class PlaceEntityToCachedSchemaConverter extends IPlaceEntityToCachedSchemaConverter {
  const PlaceEntityToCachedSchemaConverter();

  @override
  CachedPlaceSchema convert(PlaceEntity input) {
    return CachedPlaceSchema(
      id: input.id,
      name: input.name,
      description: input.description,
      imageUrls: jsonEncode(input.imageUrls),
      lat: input.lat,
      lon: input.lon,
      placeTypeName: input.placeType.name,
    );
  }
}

/// Конвертер [PlaceEntity] <-> [CachedPlaceSchema].
typedef IPlaceEntityAndCachedSchemaConverter = ConverterToAndFrom<CachedPlaceSchema, PlaceEntity>;

/// Реализация [IPlaceEntityAndCachedSchemaConverter]
final class PlaceEntityAndCachedSchemaConverter extends IPlaceEntityAndCachedSchemaConverter {
  final ICachedPlaceSchemaToEntityConverter cachedPlaceSchemaToEntityConverter;
  const PlaceEntityAndCachedSchemaConverter({required this.cachedPlaceSchemaToEntityConverter});

  @override
  Converter<CachedPlaceSchema, PlaceEntity> get converter => const PlaceEntityToCachedSchemaConverter();

  @override
  Converter<PlaceEntity, CachedPlaceSchema> get reverseConverter => cachedPlaceSchemaToEntityConverter;
}
