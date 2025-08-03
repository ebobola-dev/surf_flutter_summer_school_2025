import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/di/places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/filters.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/places/di/search_places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_state.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/searched_item.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';

PlacesWM defaultPlacesWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final placesScope = context.read<IPlacesScope>();
  final searchPlacesScope = context.read<ISearchPlacesScope>();
  final appRouter = context.read<AppRouter>();
  return PlacesWM(
    PlacesModel(
      logWriter: appScope.logger,
      placesRepository: placesScope.placesRepository,
      searchPlacesRepository: searchPlacesScope.searchPlacesRepository,
    ),
    appRouter: appRouter,
  );
}

abstract interface class IPlacesWM with ThemeIModelMixin implements IWidgetModel {
  ScrollController get placesScrollController;
  ScrollController get searchScrollController;
  TextEditingController get searchTextController;
  FocusNode get searchFocusNode;
  ValueListenable<bool> get isLoading;
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap;
  ValueListenable<bool> get filtersModified;
  ValueListenable<bool> get showSearch;
  ValueListenable<SearchState> get searchState;
  ValueListenable<List<SearchedItemEntity>> get searchHistory;

  Future<void> onRefreshPlaces();
  Future<void> onRefreshSearch();
  void onPlaceTap(int placeId);
  void onPlaceLikeTap(int placeId);
  void onFilterTap();
  void onCloseSearchTap();
  void onSearchedItemTap(String query);
  void onSearchedItemDeleteTap(String query);
  void onClearSearchHistoryTap();
}

final class PlacesWM extends WidgetModel<PlacesScreen, PlacesModel> with ThemeWMMixin implements IPlacesWM {
  PlacesWM(
    super._model, {
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  final placesScrollController = ScrollController();

  @override
  final searchScrollController = ScrollController();

  late final StreamSubscription<String> _errorSubscription;

  // Отфильтрованные места
  final _filteredPlacesMap = ValueNotifier<SortedMap<int, FavoritePlaceEntity>?>(null);

  // Фильтры не нужны ui, ui нужно только знать дефолтные они или нет
  // ValueNotifier сделал только для того чтобы удобно повесить на него слушатель
  final _filters = ValueNotifier<FilterSettings>(FilterSettings.base());

  // Дефолтые фильтры или нет - для ui
  final _filtersModified = ValueNotifier<bool>(false);

  // % Поиск ↓ ↓ ↓
  // Контроллер для текстового поля поиска
  @override
  final searchTextController = TextEditingController();

  @override
  final searchFocusNode = FocusNode();

  final _showSearch = ValueNotifier<bool>(false);

  // Таймер для поиска
  Timer? _searchTimer;

  // Чтобы не пикать поиск на одно и тоже несколько раз
  // У TextEditingController итогда срабатывает листенер при изменении фокуса, нам такое не надо
  String _lastSearchText = '';
  // %

  @override
  void initWidgetModel() {
    _errorSubscription = model.errorsStream.listen(_errorListener);
    _filters.addListener(_filtersListener);
    model.placesMap.addListener(_applyFilters);
    searchTextController.addListener(_searchTextListener);
    searchFocusNode.addListener(_searchFocusListener);
    searchScrollController.addListener(_searchScrollListener);
    model.searchState.addListener(_searchStateListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    searchTextController
      ..removeListener(_searchTextListener)
      ..dispose();
    searchFocusNode
      ..removeListener(_searchFocusListener)
      ..dispose();
    searchScrollController
      ..removeListener(_searchScrollListener)
      ..dispose();
    model.searchState.removeListener(_searchStateListener);
    _showSearch.dispose();
    _searchTimer?.cancel();
    _filters.removeListener(_filtersListener);
    model.placesMap.removeListener(_applyFilters);
    _errorSubscription.cancel();
    _filteredPlacesMap.dispose();
    placesScrollController.dispose();
    _filters.dispose();
    _filtersModified.dispose();
    super.dispose();
  }

  @override
  ValueListenable<bool> get isLoading => model.isLoading;

  @override
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap => _filteredPlacesMap;

  @override
  ValueListenable<bool> get filtersModified => _filtersModified;

  @override
  ValueListenable<bool> get showSearch => _showSearch;

  @override
  ValueListenable<SearchState> get searchState => model.searchState;

  @override
  ValueListenable<List<SearchedItemEntity>> get searchHistory => model.searchHistory;

  @override
  Future<void> onRefreshPlaces() async {
    if (model.isLoading.value) return;
    unawaited(model.refresh());
    final completer = Completer<void>();
    void loadedListener() {
      if (!model.isLoading.value) {
        completer.complete();
      }
    }

    model.isLoading.addListener(loadedListener);
    await completer.future;
    model.isLoading.removeListener(loadedListener);
  }

  @override
  Future<void> onRefreshSearch() async {
    // Если поиск в процессе или дефолтный(поле пустое) - ливаем
    if (model.searchState.value case ProcessingSearchState() || BaseSearchState()) return;

    unawaited(model.research());
    final completer = Completer<void>();
    void loadedListener() {
      if (model.searchState.value is! ProcessingSearchState) {
        completer.complete();
      }
    }

    model.searchState.addListener(loadedListener);
    await completer.future;
    model.searchState.removeListener(loadedListener);
  }

  @override
  void onPlaceTap(int placeId) {
    _appRouter.push(PlaceDetailRoute(placeId: placeId));
  }

  @override
  void onPlaceLikeTap(int placeId) => model.toggleLike(placeId);

  @override
  Future<void> onFilterTap() async {
    final changedFilters = await _appRouter.push<FilterSettings?>(FilterRoute(initialSettings: _filters.value));
    if (changedFilters != null) {
      _filters.emit(changedFilters);
    }
  }

  @override
  void onCloseSearchTap() {
    _showSearch.emit(false);
    searchFocusNode.unfocus();
    searchTextController.clear();
    model.resetSearchState();
  }

  @override
  void onSearchedItemTap(String query) {
    if (_showSearch.value && model.searchState.value is BaseSearchState) {
      searchTextController.text = query;
    }
  }

  @override
  void onSearchedItemDeleteTap(String query) => model.deleteQueryFromSearchHistory(query);

  @override
  void onClearSearchHistoryTap() => model.clearSearchHistory();

  void _errorListener(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }

  void _filtersListener() {
    _filtersModified.emit(_filters.value != FilterSettings.base());
    _applyFilters();
  }

  void _applyFilters() {
    final sourcePlacesMap = model.placesMap.value;
    if (sourcePlacesMap != null) {
      final filteredPlacesMap = _filter(sourcePlacesMap);
      _filteredPlacesMap.emit(filteredPlacesMap);
    } else {
      _filteredPlacesMap.emit(null);
    }
  }

  /// Фильтрует входящую мапу по текущим фильтрам, входящие данные должны быть полностью исходными (из модели)
  SortedMap<int, FavoritePlaceEntity> _filter(SortedMap<int, FavoritePlaceEntity> sourceMap) {
    // Если фильтры дефолтные - возвращаем исходную мапу
    if (!_filtersModified.value) return sourceMap;

    final filteredPlaceTypes = _filters.value.categories.map((category) => category.placeType);

    // Ids неподходящих под фильтры мест
    final wrongIds = sourceMap.data.entries
        .where(
          (entry) => !filteredPlaceTypes.contains(entry.value.place.placeType),
        )
        .map((entry) => entry.key)
        .toSet();

    return sourceMap.copyWithoutMany(wrongIds);
  }

  void _searchFocusListener() {
    final hasFocus = searchFocusNode.hasFocus;
    if (hasFocus) {
      _showSearch.emit(true);
    }
  }

  void _searchTextListener() {
    final queryText = searchTextController.text;

    // Если текст не изменился, ничего не делаем
    if (queryText == _lastSearchText) return;
    _lastSearchText = queryText;
    //

    _searchTimer?.cancel();
    if (queryText.isNotEmpty) {
      _searchTimer = Timer(const Duration(milliseconds: 500), _callSearch);
    } else {
      model.search(query: '');
    }
  }

  void _callSearch() {
    final queryText = searchTextController.text;
    if (queryText.isEmpty) return;
    model.search(query: queryText);
  }

  void _searchScrollListener() {
    if (searchScrollController.position.pixels >= searchScrollController.position.maxScrollExtent - 100) {
      model.searchMore();
    }
  }

  void _searchStateListener() {
    final state = model.searchState.value;
    if (state is FoundSearchState && state.hasMore && !state.isLoadingMore) {
      _checkScollableLoad();
    }
  }

  /// Проверяем заполнили ли карточки весь экран
  /// То есть скроллится ли список
  /// Если карточки не заполнили весь экран, то список будет не скроллируемым
  /// И тогда не получится подгружать, поэтому вызываем подгрузку автоматом (если не скроллится)
  void _checkScollableLoad() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!searchScrollController.hasClients) return;
      final isScollable = searchScrollController.position.maxScrollExtent > 0;
      if (!isScollable) {
        model.searchMore();
      }
    });
  }
}
