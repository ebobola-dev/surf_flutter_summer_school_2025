// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultDto _$SearchResultDtoFromJson(Map<String, dynamic> json) =>
    SearchResultDto(
      query: json['query'] as String,
      total: (json['total'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => FoundPlaceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
