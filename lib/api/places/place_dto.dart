import 'package:json_annotation/json_annotation.dart';
import 'package:surf_flutter_summer_school_2025/api/places/place_type_dto.dart';

part 'place_dto.g.dart';

@JsonSerializable(createToJson: false)
class PlaceDto {
  final int id;

  final String name;

  final double lat;

  @JsonKey(name: 'lng')
  final double lon;

  final String description;

  @JsonKey(name: 'type')
  final PlaceTypeDto placeType;

  @JsonKey(name: 'urls')
  final List<String> imageUrls;

  const PlaceDto({
    required this.id,
    required this.name,
    required this.description,
    required this.placeType,
    required this.imageUrls,
    required this.lat,
    required this.lon,
  });

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);
}
