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

/// Конвертер из [PlaceTypeScheme] в [PlaceTypeEntity].
typedef IPlaceTypeSchemeToEntityConverter = Converter<PlaceTypeEntity, PlaceTypeScheme>;

/// Реализация [IPlaceTypeSchemeToEntityConverter]
final class PlaceTypeSchemeToEntityConverter extends IPlaceTypeSchemeToEntityConverter {
  const PlaceTypeSchemeToEntityConverter();

  @override
  PlaceTypeEntity convert(PlaceTypeScheme input) {
    return PlaceTypeEntity.values.firstWhere((p) => p.name == input.name);
  }
}

/// Конвертер из [PlaceTypeEntity] в [PlaceTypeScheme].
typedef IPlaceTypeEntityToSchemeConverter = Converter<PlaceTypeScheme, PlaceTypeEntity>;

/// Реализация [IPlaceTypeEntityToSchemeConverter]
final class PlaceTypeEntityToSchemeConverter extends IPlaceTypeEntityToSchemeConverter {
  const PlaceTypeEntityToSchemeConverter();

  @override
  PlaceTypeScheme convert(PlaceTypeEntity input) {
    return PlaceTypeScheme(name: input.name);
  }
}

/// Конвертер [PlaceTypeEntity] <-> [PlaceTypeScheme]
typedef IPlaceTypeSchemeAndEntityConverter = ConverterToAndFrom<PlaceTypeEntity, PlaceTypeScheme>;

/// Реализация [IPlaceTypeSchemeAndEntityConverter]
final class PlaceTypeSchemeAndEntityConverter extends IPlaceTypeSchemeAndEntityConverter {
  const PlaceTypeSchemeAndEntityConverter();

  @override
  Converter<PlaceTypeEntity, PlaceTypeScheme> get converter => throw UnimplementedError();

  @override
  Converter<PlaceTypeScheme, PlaceTypeEntity> get reverseConverter => throw UnimplementedError();
}

//% Cached
/// Конвертер из [CachedPlaceTypeScheme] в [PlaceTypeEntity].
typedef ICachedPlaceTypeSchemeToEntityConverter = Converter<PlaceTypeEntity, CachedPlaceTypeScheme>;

/// Реализация [ICachedPlaceTypeSchemeToEntityConverter]
final class CachedPlaceTypeSchemeToEntityConverter extends ICachedPlaceTypeSchemeToEntityConverter {
  const CachedPlaceTypeSchemeToEntityConverter();

  @override
  PlaceTypeEntity convert(CachedPlaceTypeScheme input) {
    return PlaceTypeEntity.values.firstWhere((p) => p.name == input.name);
  }
}

/// Конвертер из [PlaceTypeEntity] в [CachedPlaceTypeScheme].
typedef IPlaceTypeEntityToCachedSchemeConverter = Converter<CachedPlaceTypeScheme, PlaceTypeEntity>;

/// Реализация [IPlaceTypeEntityToCachedSchemeConverter]
final class PlaceTypeEntityToCachedSchemeConverter extends IPlaceTypeEntityToCachedSchemeConverter {
  const PlaceTypeEntityToCachedSchemeConverter();

  @override
  CachedPlaceTypeScheme convert(PlaceTypeEntity input) {
    return CachedPlaceTypeScheme(name: input.name);
  }
}

/// Конвертер [PlaceTypeEntity] <-> [CachedPlaceTypeScheme]
typedef ICachedPlaceTypeSchemeAndEntityConverter = ConverterToAndFrom<PlaceTypeEntity, CachedPlaceTypeScheme>;

/// Реализация [ICachedPlaceTypeSchemeAndEntityConverter]
final class CachedPlaceTypeSchemeAndEntityConverter extends ICachedPlaceTypeSchemeAndEntityConverter {
  const CachedPlaceTypeSchemeAndEntityConverter();

  @override
  Converter<PlaceTypeEntity, CachedPlaceTypeScheme> get converter => throw UnimplementedError();

  @override
  Converter<CachedPlaceTypeScheme, PlaceTypeEntity> get reverseConverter => throw UnimplementedError();
}
