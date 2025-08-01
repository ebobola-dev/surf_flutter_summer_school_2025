import 'package:json_annotation/json_annotation.dart';
import 'package:surf_flutter_summer_school_2025/api/places/found_place_dto.dart';

part 'search_result_dto.g.dart';

@JsonSerializable(createToJson: false)
class SearchResultDto {
  final String query;
  final int total;
  final List<FoundPlaceDto> results;

  SearchResultDto({
    required this.query,
    required this.total,
    required this.results,
  });

  factory SearchResultDto.fromJson(Map<String, dynamic> json) => _$SearchResultDtoFromJson(json);
}
