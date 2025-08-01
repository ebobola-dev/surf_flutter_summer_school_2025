import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance.freezed.dart';

@freezed
abstract class DistanceFilter with _$DistanceFilter {
  const DistanceFilter._();
  const factory DistanceFilter({
    required int min,
    required int max,
  }) = _DistanceFilter;

  factory DistanceFilter.base() => DistanceFilter(
    min: 0,
    max: 30,
  );
}
