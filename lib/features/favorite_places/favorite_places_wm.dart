import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/common/di/places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';

FavoritePlacesWM defaultFavoritePlacesWMFactory(BuildContext context) {
  final placesScope = context.read<IPlacesScope>();
  final appRouter = context.read<AppRouter>();
  return FavoritePlacesWM(
    appRouter: appRouter,
    FavoritePlacesModel(placesRepository: placesScope.placesRepository),
  );
}

abstract interface class IFavoritePlacesWM with ThemeIModelMixin implements IWidgetModel {
  ScrollController get scrollController;
  ValueListenable<bool> get isLoading;
  ValueListenable<SortedMap<int, PlaceEntity>?> get favoritesMap;
  ValueNotifier<int?> get currentDissmisedPlaceId;

  void onRefreshTap();
  void onPlaceCardTap(int placeId);
  void onPlaceShareTap(int placeId);
  void onPlaceDislikeTap(int placeId);
  void onPlaceDislikeConfirmTap(int placeId);
  void onOutsideTap();
}

final class FavoritePlacesWM extends WidgetModel<FavoritePlacesScreen, FavoritePlacesModel>
    with ThemeWMMixin
    implements IFavoritePlacesWM {
  FavoritePlacesWM(
    super._model, {
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  final scrollController = ScrollController();

  late final StreamSubscription<String> _errorsSubscription;

  final _currentDissmisedPlaceId = ValueNotifier<int?>(null);

  @override
  void initWidgetModel() {
    _errorsSubscription = model.errorsStream.listen(_errorsListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _errorsSubscription.cancel();
    scrollController.dispose();
    _currentDissmisedPlaceId.dispose();
    super.dispose();
  }

  @override
  ValueListenable<bool> get isLoading => model.isLoading;

  @override
  ValueListenable<SortedMap<int, PlaceEntity>?> get favoritesMap => model.favoritesMap;

  @override
  ValueNotifier<int?> get currentDissmisedPlaceId => _currentDissmisedPlaceId;

  @override
  void onRefreshTap() => model.refresh();

  @override
  void onPlaceCardTap(int placeId) {
    _appRouter.push(PlaceDetailRoute(placeId: placeId));
  }

  @override
  void onPlaceShareTap(int placeId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tap on share #$placeId, not implemented')),
    );
  }

  @override
  void onPlaceDislikeTap(int placeId) {
    if (_currentDissmisedPlaceId.value == placeId) {
      _currentDissmisedPlaceId.emit(null);
    } else {
      _currentDissmisedPlaceId.emit(placeId);
    }
  }

  @override
  void onPlaceDislikeConfirmTap(int placeId) {
    model.unlike(placeId);
    _currentDissmisedPlaceId.emit(null);
  }

  @override
  void onOutsideTap() {
    _currentDissmisedPlaceId.emit(null);
  }

  void _errorsListener(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}
