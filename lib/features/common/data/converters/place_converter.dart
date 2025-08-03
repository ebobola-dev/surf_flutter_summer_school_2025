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

/// Конвертер из [PlaceScheme] в [PlaceEntity].
typedef IPlaceSchemeToEntityConverter = Converter<PlaceEntity, PlaceScheme>;

/// Реализация [IPlaceSchemeToEntityConverter]
final class PlaceSchemeToEntityConverter extends IPlaceSchemeToEntityConverter {
  final IPlaceTypeSchemeToEntityConverter cachedPlaceTypeSchemeToEntityConverter;
  const PlaceSchemeToEntityConverter({
    required this.cachedPlaceTypeSchemeToEntityConverter,
  });

  @override
  PlaceEntity convert(PlaceScheme input) {
    final placeType = cachedPlaceTypeSchemeToEntityConverter.convert(PlaceTypeScheme(name: input.placeTypeName));
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

/// Конвертер из [PlaceEntity] в [PlaceScheme].
typedef IPlaceEntityToSchemeConverter = Converter<PlaceScheme, PlaceEntity>;

/// Реализация [IPlaceEntityToSchemeConverter]
final class PlaceEntityToSchemeConverter extends IPlaceEntityToSchemeConverter {
  const PlaceEntityToSchemeConverter();

  @override
  PlaceScheme convert(PlaceEntity input) {
    return PlaceScheme(
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

/// Конвертер [PlaceEntity] <-> [PlaceScheme].
typedef IPlaceEntityAndSchemeConverter = ConverterToAndFrom<PlaceScheme, PlaceEntity>;

/// Реализация [IPlaceEntityAndSchemeConverter]
final class PlaceEntityAndSchemeConverter extends IPlaceEntityAndSchemeConverter {
  final IPlaceSchemeToEntityConverter cachedPlaceSchemeToEntityConverter;
  const PlaceEntityAndSchemeConverter({required this.cachedPlaceSchemeToEntityConverter});

  @override
  Converter<PlaceScheme, PlaceEntity> get converter => const PlaceEntityToSchemeConverter();

  @override
  Converter<PlaceEntity, PlaceScheme> get reverseConverter => cachedPlaceSchemeToEntityConverter;
}

// % Cached
/// Конвертер из [CachedPlaceScheme] в [PlaceEntity].
typedef ICachedPlaceSchemeToEntityConverter = Converter<PlaceEntity, CachedPlaceScheme>;

/// Реализация [ICachedPlaceSchemeToEntityConverter]
final class CachedPlaceSchemeToEntityConverter extends ICachedPlaceSchemeToEntityConverter {
  final ICachedPlaceTypeSchemeToEntityConverter cachedPlaceTypeSchemeToEntityConverter;
  const CachedPlaceSchemeToEntityConverter({
    required this.cachedPlaceTypeSchemeToEntityConverter,
  });

  @override
  PlaceEntity convert(CachedPlaceScheme input) {
    final placeType = cachedPlaceTypeSchemeToEntityConverter.convert(CachedPlaceTypeScheme(name: input.placeTypeName));
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

/// Конвертер из [PlaceEntity] в [CachedPlaceScheme].
typedef IPlaceEntityToCachedSchemeConverter = Converter<CachedPlaceScheme, PlaceEntity>;

/// Реализация [IPlaceEntityToCachedSchemeConverter]
final class PlaceEntityToCachedSchemeConverter extends IPlaceEntityToCachedSchemeConverter {
  const PlaceEntityToCachedSchemeConverter();

  @override
  CachedPlaceScheme convert(PlaceEntity input) {
    return CachedPlaceScheme(
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

/// Конвертер [PlaceEntity] <-> [CachedPlaceScheme].
typedef IPlaceEntityAndCachedSchemeConverter = ConverterToAndFrom<CachedPlaceScheme, PlaceEntity>;

/// Реализация [IPlaceEntityAndCachedSchemeConverter]
final class PlaceEntityAndCachedSchemeConverter extends IPlaceEntityAndCachedSchemeConverter {
  final ICachedPlaceSchemeToEntityConverter cachedPlaceSchemeToEntityConverter;
  const PlaceEntityAndCachedSchemeConverter({required this.cachedPlaceSchemeToEntityConverter});

  @override
  Converter<CachedPlaceScheme, PlaceEntity> get converter => const PlaceEntityToCachedSchemeConverter();

  @override
  Converter<PlaceEntity, CachedPlaceScheme> get reverseConverter => cachedPlaceSchemeToEntityConverter;
}
