import 'package:freezed_annotation/freezed_annotation.dart';

part 'searched_item.freezed.dart';

/// Айтем истории поиска
@freezed
abstract class SearchedItemEntity with _$SearchedItemEntity {
  const SearchedItemEntity._();
  const factory SearchedItemEntity({
    required String query,
    required DateTime requestedAt,
  }) = _SearchedItemEntity;
}
