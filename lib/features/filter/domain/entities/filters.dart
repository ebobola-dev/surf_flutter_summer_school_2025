import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/categories.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/distance.dart';

part 'filters.freezed.dart';

@freezed
abstract class FilterSettings with _$FilterSettings {
  const FilterSettings._();
  const factory FilterSettings({
    required DistanceFilter distance,
    required Set<Categories> categories,
  }) = _FilterSettings;

  factory FilterSettings.base() => FilterSettings(
    distance: DistanceFilter.base(),
    categories: Categories.values.toSet(),
  );
}
