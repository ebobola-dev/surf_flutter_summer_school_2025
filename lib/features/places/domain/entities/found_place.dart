import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';

part 'found_place.freezed.dart';

@freezed
abstract class FoundPlaceEntity with _$FoundPlaceEntity {
  const FoundPlaceEntity._();
  const factory FoundPlaceEntity({
    required double relevanceScore,
    required PlaceEntity place,
  }) = _FoundPlaceEntity;

  int get placeId => place.id;
}
