import 'package:json_annotation/json_annotation.dart';
import 'package:surf_flutter_summer_school_2025/api/places/place_dto.dart';

part 'found_place_dto.g.dart';

@JsonSerializable(createToJson: false)
class FoundPlaceDto {
  final double relevanceScore;

  final PlaceDto place;

  const FoundPlaceDto({
    required this.relevanceScore,
    required this.place,
  });

  factory FoundPlaceDto.fromJson(Map<String, dynamic> json) => _$FoundPlaceDtoFromJson(json);
}
