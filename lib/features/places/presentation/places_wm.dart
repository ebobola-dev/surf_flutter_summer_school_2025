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
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';

PlacesWM defaultPlacesWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final placesScope = context.read<IPlacesScope>();
  final appRouter = context.read<AppRouter>();
  return PlacesWM(
    PlacesModel(
      logWriter: appScope.logger,
      placesRepository: placesScope.placesRepository,
    ),
    appRouter: appRouter,
  );
}

abstract interface class IPlacesWM with ThemeIModelMixin implements IWidgetModel {
  ScrollController get scrollController;
  TextEditingController get searchTextController;
  ValueListenable<bool> get isLoading;
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap;
  ValueListenable<bool> get filtersModified;

  Future<void> onRefresh();
  void onPlaceTap(int placeId);
  void onPlaceLikeTap(int placeId);
  void onFilterTap();
}

final class PlacesWM extends WidgetModel<PlacesScreen, PlacesModel> with ThemeWMMixin implements IPlacesWM {
  PlacesWM(
    super._model, {
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  final scrollController = ScrollController();

  @override
  final searchTextController = TextEditingController();

  late final StreamSubscription<String> _errorSubscription;

  // Отфильтрованные места
  final _filteredPlacesMap = ValueNotifier<SortedMap<int, FavoritePlaceEntity>?>(null);

  // Фильтры не нужны ui, ui нужно только знать дефолтные они или нет
  // ValueNotifier сделал только для того чтобы удобно повесить на него слушатель
  final _filters = ValueNotifier<FilterSettings>(FilterSettings.base());

  // Дефолтые фильтры или нет - для ui
  final _filtersModified = ValueNotifier<bool>(false);

  @override
  void initWidgetModel() {
    _errorSubscription = model.errorsStream.listen(_errorListener);
    _filters.addListener(_filtersListener);
    model.placesMap.addListener(_applyFilters);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _filters.removeListener(_filtersListener);
    model.placesMap.removeListener(_applyFilters);
    _errorSubscription.cancel();
    _filteredPlacesMap.dispose();
    scrollController.dispose();
    searchTextController.dispose();
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
  Future<void> onRefresh() async {
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
  void onPlaceTap(int placeId) {
    model.logWriter.log('tap on place #$placeId');
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
}
