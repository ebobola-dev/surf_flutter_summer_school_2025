import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/stream_controller.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/api_failure.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/result.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/core/presentation/base_model.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_state.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/repositories/i_search_places_repository.dart';

const _defaultSearchLimit = 10;

final class PlacesModel extends BaseModel {
  PlacesModel({
    required super.logWriter,
    required IPlacesRepository placesRepository,
    required ISearchPlacesRepository searchPlacesRepository,
  }) : _placesRepository = placesRepository,
       _searchPlacesRepository = searchPlacesRepository;

  final IPlacesRepository _placesRepository;
  final ISearchPlacesRepository _searchPlacesRepository;
  late final StreamSubscription<List<FavoritePlaceEntity>> _favoritesSubscription;
  late final StreamSubscription<List<SearchedItemEntity>> _historySubscription;
  final _isLoading = ValueNotifier<bool>(false);
  final _placesMap = ValueNotifier<SortedMap<int, FavoritePlaceEntity>?>(null);
  final _errorsController = StreamController<String>();
  Map<int, FavoritePlaceEntity> _favoritesMap = <int, FavoritePlaceEntity>{};

  final _searchState = ValueNotifier<SearchState>(SearchState.base());
  final _searchHistory = ValueNotifier<List<SearchedItemEntity>>([]);

  ValueListenable<bool> get isLoading => _isLoading;
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap => _placesMap;
  ValueListenable<SearchState> get searchState => _searchState;
  ValueListenable<List<SearchedItemEntity>> get searchHistory => _searchHistory;
  Stream<String> get errorsStream => _errorsController.stream;

  @override
  void init() {
    _favoritesSubscription = _placesRepository.favoritesStream.listen(_favoritesListener);
    _historySubscription = _searchPlacesRepository.historyStream.listen(_searchHistoryListener);
    unawaited(_initFavorites());
    unawaited(refresh());
    unawaited(_initSearchHistory());
    super.init();
  }

  @override
  void dispose() {
    _isLoading.dispose();
    _placesMap.dispose();
    _errorsController.close();
    _favoritesSubscription.cancel();
    _historySubscription.cancel();
    _searchState.dispose();
    _searchHistory.dispose();
    super.dispose();
  }

  void _favoritesListener(List<FavoritePlaceEntity> favorites) {
    _favoritesMap = {for (final fp in favorites) fp.id: fp};
    _combineFavorites();
  }

  void _searchHistoryListener(List<SearchedItemEntity> history) {
    _searchHistory.emit(history);
  }

  Future<void> _initFavorites() async {
    final result = await makeCall(_placesRepository.getFavoritePlaces);
    switch (result) {
      case ResultOk(:final data):
        {
          _favoritesMap = {for (final fp in data) fp.id: fp};
        }
      case ResultFailed():
        _errorsController.safeAdd('Не удалось получить избранные');
    }
  }

  void _combineFavorites() {
    if (_placesMap.value != null) {
      _placesMap.emit(_convert(_placesMap.value!.data.entries.map((entry) => entry.value.place).toList()));
    }
  }

  SortedMap<int, FavoritePlaceEntity> _convert(List<PlaceEntity> places) {
    return SortedMap.fromList(
      list: places.map((p) {
        final favoritePlace = _favoritesMap[p.id];
        return FavoritePlaceEntity(
          place: p,
          likedAt: favoritePlace?.likedAt,
        );
      }).toList(),
      getId: (p) => p.place.id,
    );
  }

  Future<void> refresh() async {
    if (_isLoading.value) return;
    _isLoading.emit(true);

    if (_placesMap.value == null) {
      // first load, call cache
      final cachedPlacesResult = await _placesRepository.getAllCachedPlaces();
      if (cachedPlacesResult case ResultOk(:final data)) {
        if (data.isNotEmpty) {
          _placesMap.emit(_convert(data));
        }
      }
    }

    final placesResult = await _placesRepository.fetchAllPlaces();
    switch (placesResult) {
      case ResultOk(:final data):
        {
          _placesMap.emit(_convert(data));
        }
      case ResultFailed(:final failure):
        {
          final message = switch (failure) {
            ApiFailure(:final errorMessage) => errorMessage,
            _ => 'Ошибка',
          };
          _errorsController.safeAdd(message);
        }
    }
    _isLoading.emit(false);
  }

  Future<void> toggleLike(int placeId) async {
    final isFavorite = await makeCall(() => _placesRepository.isFavorite(placeId));
    switch (isFavorite) {
      case ResultFailed():
        _errorsController.safeAdd('Ошибка');
      case ResultOk(:final data):
        {
          if (data) {
            final result = await makeCall(() => _placesRepository.unlikePlace(placeId));
            if (result case ResultFailed()) {
              _errorsController.safeAdd('Ошибка');
            }
          } else {
            final place = _placesMap.value?.data[placeId]?.place;
            if (place == null) return;
            final result = await makeCall(() => _placesRepository.likePlace(place));
            if (result case ResultFailed()) {
              _errorsController.safeAdd('Ошибка');
            }
          }
        }
    }
  }

  void resetSearchState() => _searchState.emit(SearchState.base());

  Future<void> research() async {
    final state = _searchState.value;
    // Если поиск в процессе или дефолтный(поле пустое) - ливаем
    if (state case ProcessingSearchState() || BaseSearchState()) return;

    // Делаем поиск с дефолтными offset и limit
    await search(query: state.query);
  }

  Future<void> search({
    required String query,
    int offset = 0,
    int limit = _defaultSearchLimit,
  }) async {
    // Если query пустой - ставим дефолтный стейт
    if (query.isEmpty) {
      resetSearchState();
      return;
    }

    // Если уже ищем и ищем тоже самое, ливаем
    if (_searchState.value is ProcessingSearchState && _searchState.value.query == query) {
      return;
    }

    _searchState.emit(
      SearchState.processing(query: query),
    );
    final searchResult = await _searchPlacesRepository.search(
      query: query,
      offset: offset,
      limit: limit,
    );

    // Если стейт как то изменился, то ливаем
    // Значит во время поиска юзер что-то сделал с полем поиска(ввёл новый текст) или закрыл поиск
    if (_searchState.value != SearchState.processing(query: query)) return;

    switch (searchResult) {
      case ResultFailed():
        {
          _errorsController.safeAdd('Ошибка');
          _searchState.emit(
            SearchState.error(query: query),
          );
        }
      case ResultOk(:final data):
        {
          if (data.results.isEmpty) {
            _searchState.emit(
              SearchState.notFound(query: query),
            );
          } else {
            _searchState.emit(
              SearchState.found(
                query: query,
                result: data,
                // hasMore = true, если нам пришло меньше total
                hasMore: data.results.length < data.total,
              ),
            );

            // Если мы дошли до сюда, значит прошёл полноценный поиск и мы что то нашли
            // Тогда сохраняем query в бд
            await _saveQueryToSearchHistory(query);
          }
        }
    }
  }

  /// Искать дальше (пагинация)
  Future<void> searchMore() async {
    final initialState = _searchState.value;

    // Ливаем, если (хотя бы одно из):
    // - state не подходящий (только на Found можно подгружать ещё)
    // - hasMore = false
    // - isLoadingMore = true (уже подгружаем)
    if (initialState is! FoundSearchState || !initialState.hasMore || initialState.isLoadingMore) {
      return;
    }

    // Ставим флаг подгрузки
    _searchState.emit(initialState.copyWith(isLoadingMore: true));

    final searchResult = await _searchPlacesRepository.search(
      query: initialState.query,
      // offset = кол-во уже имеющихся, начинаем с них
      offset: initialState.offset,
    );

    // Если во время запроса стейт хоть как то изменился - ливаем
    if (_searchState.value != initialState.copyWith(isLoadingMore: true)) {
      return;
    }

    switch (searchResult) {
      case ResultFailed():
        {
          _searchState.emit(initialState.copyWith(isLoadingMore: false));
        }
      case ResultOk(:final data):
        {
          final newResults = data.results;
          final combinedResults = initialState.result.results.copyWithAdditionalData(
            additionalData: newResults.list,
            getId: (fp) => fp.placeId,
          );
          final updatedSearchResult = initialState.result.copyWith(
            results: combinedResults,
          );
          _searchState.emit(
            initialState.copyWith(
              isLoadingMore: false,
              result: updatedSearchResult,
              // hasMore = true, пока наш список меньше total
              hasMore: combinedResults.length < initialState.result.total,
            ),
          );
        }
    }
  }

  // Search history

  /// Инициализируем историю поиска
  ///
  /// Очень базово получаем из бд, не обращая внимания на ошибки
  Future<void> _initSearchHistory() async {
    final result = await _searchPlacesRepository.getSearchHistory();
    if (result case ResultOk(:final data)) {
      _searchHistory.emit(data);
    }
  }

  /// Сохраняем query в бд
  // Мы пикаем это отсюда (из presentation)
  // Так как именно тут мы решаем что показать ui, а что отсечь
  // Лучше сохранять только то, что дошло до юзера, а не весь мусор
  Future<void> _saveQueryToSearchHistory(String query) async {
    await _searchPlacesRepository.saveQueryToSearchHistory(query);
  }

  Future<void> deleteQueryFromSearchHistory(String query) async {
    final result = await _searchPlacesRepository.deleteQueryFromHistory(query);
    if (result case ResultFailed()) {
      _errorsController.safeAdd('Не удалось удалить');
    }
  }

  Future<void> clearSearchHistory() async {
    final result = await _searchPlacesRepository.clearHistory();
    if (result case ResultFailed()) {
      _errorsController.safeAdd('Не удалось отчистить историю');
    }
  }
}
