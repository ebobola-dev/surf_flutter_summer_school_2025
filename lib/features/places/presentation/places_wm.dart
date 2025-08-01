import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/di/places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';

PlacesWM defaultPlacesWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final placesScope = context.read<IPlacesScope>();
  return PlacesWM(
    PlacesModel(
      logWriter: appScope.logger,
      placesRepository: placesScope.placesRepository,
    ),
  );
}

abstract interface class IPlacesWM with ThemeIModelMixin implements IWidgetModel {
  ScrollController get scrollController;
  TextEditingController get searchTextController;
  ValueListenable<bool> get isLoading;
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap;

  Future<void> onRefresh();
  void onPlaceTap(int placeId);
  void onPlaceLikeTap(int placeId);
  void onFilterTap();
}

final class PlacesWM extends WidgetModel<PlacesScreen, PlacesModel> with ThemeWMMixin implements IPlacesWM {
  PlacesWM(super._model);

  @override
  final scrollController = ScrollController();
  @override
  final searchTextController = TextEditingController();
  late final StreamSubscription<String> _errorSubscription;

  @override
  void initWidgetModel() {
    _errorSubscription = model.errorsStream.listen(_errorListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _errorSubscription.cancel();
    scrollController.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  @override
  ValueListenable<bool> get isLoading => model.isLoading;

  @override
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap => model.placesMap;

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
  void onFilterTap() {
    model.logWriter.log('tap on filter');
  }

  void _errorListener(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}
