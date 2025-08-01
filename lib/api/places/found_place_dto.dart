import 'package:json_annotation/json_annotation.dart';

part 'found_place_dto.g.dart';

@JsonSerializable(createToJson: false)
class FoundPlaceDto {
  final double relevanceScore;

  final FoundPlaceDto place;

  const FoundPlaceDto({
    required this.relevanceScore,
    required this.place,
  });

  factory FoundPlaceDto.fromJson(Map<String, dynamic> json) => _$FoundPlaceDtoFromJson(json);
}
