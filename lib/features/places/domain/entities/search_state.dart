import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_result.dart';

part 'search_state.freezed.dart';

@freezed
sealed class SearchState with _$SearchState {
  // query есть практически во всех стейтах, кроме разве что базового, поэтому решил его вынести
  @override
  String get query;

  /// Базовый пустой стейт
  factory SearchState.base({
    @Default('') String query,
  }) = BaseSearchState;

  /// Поиск (загрузка, loading, isLoading и тому подобное)
  factory SearchState.processing({
    required String query,
  }) = ProcessingSearchState;

  /// Нашли данные (не пустые)
  factory SearchState.found({
    required String query,
    required SearchResultEntity result,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
  }) = FoundSearchState;

  /// Не нашли ничего (пришёл пустой список)
  factory SearchState.notFound({
    required String query,
  }) = NotFoundSearchState;

  /// Получили ошибку при поиске
  factory SearchState.error({
    required String query,
  }) = ErrorSearchState;
}

extension FoundSearchStateExtension on FoundSearchState {
  int get offset => result.results.length;
}
