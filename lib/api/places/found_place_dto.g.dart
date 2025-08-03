// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'found_place_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoundPlaceDto _$FoundPlaceDtoFromJson(Map<String, dynamic> json) =>
    FoundPlaceDto(
      relevanceScore: (json['relevance_score'] as num).toDouble(),
      place: PlaceDto.fromJson(json['place'] as Map<String, dynamic>),
    );
