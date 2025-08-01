import 'dart:convert';

import 'package:surf_flutter_summer_school_2025/core/architecture/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_type_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/persistence/databse/persistent_database.dart';

/// Конвертер из [FavoritePlacesViewData] в [FavoritePlaceEntity].
typedef IFavoritePlaceSchemaToEntityConverter = Converter<FavoritePlaceEntity, FavoritePlacesViewData>;

/// Реализация [IFavoritePlaceSchemaToEntityConverter].
final class FavoritePlaceSchemaToEntityConverter extends IFavoritePlaceSchemaToEntityConverter {
  final IPlaceTypeSchemaToEntityConverter placeTypeSchemaToEntityConverter;
  const FavoritePlaceSchemaToEntityConverter({required this.placeTypeSchemaToEntityConverter});

  @override
  FavoritePlaceEntity convert(FavoritePlacesViewData input) {
    final placeType = placeTypeSchemaToEntityConverter.convert(PlaceTypeSchema(name: input.placeTypeName!));
    return FavoritePlaceEntity(
      place: PlaceEntity(
        id: input.id,
        name: input.name,
        description: input.description,
        imageUrls: (jsonDecode(input.imageUrls) as List<dynamic>).map((e) => e as String).toList(),
        lat: input.lat,
        lon: input.lon,
        placeType: placeType,
      ),
      //isFavorite: true,
      likedAt: input.likedAt,
    );
  }
}
