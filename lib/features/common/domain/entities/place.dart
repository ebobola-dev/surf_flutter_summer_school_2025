import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place_type.dart';

part 'place.freezed.dart';

@freezed
abstract class PlaceEntity with _$PlaceEntity {
  const PlaceEntity._();
  const factory PlaceEntity({
    required int id,
    required String name,
    required String description,
    required List<String> imageUrls,
    required double lat,
    required double lon,
    required PlaceTypeEntity placeType,
  }) = _PlaceEntity;
}
