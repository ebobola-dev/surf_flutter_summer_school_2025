import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/found_place.dart';

part 'search_result.freezed.dart';

@freezed
abstract class SearchResultEntity with _$SearchResultEntity {
  const SearchResultEntity._();
  const factory SearchResultEntity({
    required String query,
    required int total,
    required SortedMap<int, FoundPlaceEntity> results,
  }) = _SearchResultEntity;
}
