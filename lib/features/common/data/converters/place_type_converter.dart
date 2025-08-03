import 'package:surf_flutter_summer_school_2025/api/places/place_type_dto.dart';
import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place_type.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/cached_database.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// Конвертер из [PlaceTypeDto] в [PlaceTypeEntity].
typedef IPlaceTypeDtoToEntityConverter = Converter<PlaceTypeEntity, PlaceTypeDto>;

/// Реализация [IPlaceTypeDtoToEntityConverter].
final class PlaceTypeDtoToEntityConverter extends IPlaceTypeDtoToEntityConverter {
  const PlaceTypeDtoToEntityConverter();

  @override
  PlaceTypeEntity convert(PlaceTypeDto input) {
    return switch (input) {
      PlaceTypeDto.restaurant => PlaceTypeEntity.restaurant,
      PlaceTypeDto.cafe => PlaceTypeEntity.cafe,
      PlaceTypeDto.park => PlaceTypeEntity.park,
      PlaceTypeDto.museum => PlaceTypeEntity.museum,
      PlaceTypeDto.shopping => PlaceTypeEntity.shopping,
      PlaceTypeDto.other => PlaceTypeEntity.other,
      PlaceTypeDto.monument => PlaceTypeEntity.monument,
      PlaceTypeDto.theatre => PlaceTypeEntity.theatre,
      PlaceTypeDto.temple => PlaceTypeEntity.temple,
      PlaceTypeDto.hotel => PlaceTypeEntity.hotel,
    };
  }
}

/// Конвертер из [PlaceTypeSchema] в [PlaceTypeEntity].
typedef IPlaceTypeSchemaToEntityConverter = Converter<PlaceTypeEntity, PlaceTypeSchema>;

/// Реализация [IPlaceTypeSchemaToEntityConverter]
final class PlaceTypeSchemaToEntityConverter extends IPlaceTypeSchemaToEntityConverter {
  const PlaceTypeSchemaToEntityConverter();

  @override
  PlaceTypeEntity convert(PlaceTypeSchema input) {
    return PlaceTypeEntity.values.firstWhere((p) => p.name == input.name);
  }
}

/// Конвертер из [PlaceTypeEntity] в [PlaceTypeSchema].
typedef IPlaceTypeEntityToSchemaConverter = Converter<PlaceTypeSchema, PlaceTypeEntity>;

/// Реализация [IPlaceTypeEntityToSchemaConverter]
final class PlaceTypeEntityToSchemaConverter extends IPlaceTypeEntityToSchemaConverter {
  const PlaceTypeEntityToSchemaConverter();

  @override
  PlaceTypeSchema convert(PlaceTypeEntity input) {
    return PlaceTypeSchema(name: input.name);
  }
}

/// Конвертер [PlaceTypeEntity] <-> [PlaceTypeSchema]
typedef IPlaceTypeSchemaAndEntityConverter = ConverterToAndFrom<PlaceTypeEntity, PlaceTypeSchema>;

/// Реализация [IPlaceTypeSchemaAndEntityConverter]
final class PlaceTypeSchemaAndEntityConverter extends IPlaceTypeSchemaAndEntityConverter {
  const PlaceTypeSchemaAndEntityConverter();

  @override
  Converter<PlaceTypeEntity, PlaceTypeSchema> get converter => throw UnimplementedError();

  @override
  Converter<PlaceTypeSchema, PlaceTypeEntity> get reverseConverter => throw UnimplementedError();
}

//% Cached
/// Конвертер из [CachedPlaceTypeSchema] в [PlaceTypeEntity].
typedef ICachedPlaceTypeSchemaToEntityConverter = Converter<PlaceTypeEntity, CachedPlaceTypeSchema>;

/// Реализация [ICachedPlaceTypeSchemaToEntityConverter]
final class CachedPlaceTypeSchemaToEntityConverter extends ICachedPlaceTypeSchemaToEntityConverter {
  const CachedPlaceTypeSchemaToEntityConverter();

  @override
  PlaceTypeEntity convert(CachedPlaceTypeSchema input) {
    return PlaceTypeEntity.values.firstWhere((p) => p.name == input.name);
  }
}

/// Конвертер из [PlaceTypeEntity] в [CachedPlaceTypeSchema].
typedef IPlaceTypeEntityToCachedSchemaConverter = Converter<CachedPlaceTypeSchema, PlaceTypeEntity>;

/// Реализация [IPlaceTypeEntityToCachedSchemaConverter]
final class PlaceTypeEntityToCachedSchemaConverter extends IPlaceTypeEntityToCachedSchemaConverter {
  const PlaceTypeEntityToCachedSchemaConverter();

  @override
  CachedPlaceTypeSchema convert(PlaceTypeEntity input) {
    return CachedPlaceTypeSchema(name: input.name);
  }
}

/// Конвертер [PlaceTypeEntity] <-> [CachedPlaceTypeSchema]
typedef ICachedPlaceTypeSchemaAndEntityConverter = ConverterToAndFrom<PlaceTypeEntity, CachedPlaceTypeSchema>;

/// Реализация [ICachedPlaceTypeSchemaAndEntityConverter]
final class CachedPlaceTypeSchemaAndEntityConverter extends ICachedPlaceTypeSchemaAndEntityConverter {
  const CachedPlaceTypeSchemaAndEntityConverter();

  @override
  Converter<PlaceTypeEntity, CachedPlaceTypeSchema> get converter => throw UnimplementedError();

  @override
  Converter<CachedPlaceTypeSchema, PlaceTypeEntity> get reverseConverter => throw UnimplementedError();
}
