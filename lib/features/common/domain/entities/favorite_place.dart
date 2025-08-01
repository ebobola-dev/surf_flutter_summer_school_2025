import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';

part 'favorite_place.freezed.dart';

@freezed
abstract class FavoritePlaceEntity with _$FavoritePlaceEntity {
  const FavoritePlaceEntity._();
  const factory FavoritePlaceEntity({
    required PlaceEntity place,
    required DateTime? likedAt,
  }) = _FavoritePlaceEntity;

  int get id => place.id;
  bool get isFavorite => likedAt != null;
}
