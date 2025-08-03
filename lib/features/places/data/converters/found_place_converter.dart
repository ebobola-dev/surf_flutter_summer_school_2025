import 'package:surf_flutter_summer_school_2025/api/places/found_place_dto.dart';
import 'package:surf_flutter_summer_school_2025/core/data/converter/converter.dart';
import 'package:surf_flutter_summer_school_2025/features/common/data/converters/place_converter.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/found_place.dart';

/// Конвертер из [FoundPlaceDto] в [FoundPlaceEntity].
typedef IFoundPlaceDtoToEntityConverter = Converter<FoundPlaceEntity, FoundPlaceDto>;

/// Реализация [IFoundPlaceDtoToEntityConverter].
final class FoundPlaceDtoToEntityConverter extends IFoundPlaceDtoToEntityConverter {
  /// Конвертер для голых мест
  final IPlaceDtoToEntityConverter placeDtoToEntityConverter;

  const FoundPlaceDtoToEntityConverter({required this.placeDtoToEntityConverter});

  @override
  FoundPlaceEntity convert(FoundPlaceDto input) {
    return FoundPlaceEntity(
      relevanceScore: input.relevanceScore,
      place: placeDtoToEntityConverter.convert(input.place),
    );
  }
}
