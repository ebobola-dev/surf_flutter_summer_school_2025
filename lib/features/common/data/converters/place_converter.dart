import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:surf_flutter_summer_school_2025/api/places/place_dto.dart';
import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_type_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
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

/// Конвертер из [PlaceViewData] в [PlaceEntity].
typedef IPlaceSchemaToEntityConverter = Converter<PlaceEntity, PlaceViewData>;

/// Реализация [IPlaceSchemaToEntityConverter]
final class PlaceSchemaToEntityConverter extends IPlaceSchemaToEntityConverter {
  final IPlaceTypeSchemaToEntityConverter placeTypeSchemaToEntityConverter;
  const PlaceSchemaToEntityConverter({
    required this.placeTypeSchemaToEntityConverter,
  });

  @override
  PlaceEntity convert(PlaceViewData input) {
    final placeType = placeTypeSchemaToEntityConverter.convert(PlaceTypeSchema(name: input.placeTypeName!));
    return PlaceEntity(
      id: input.id,
      name: input.name,
      description: input.description,
      imageUrls: List<String>.from(jsonDecode(input.imageUrls) as List<String>),
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
