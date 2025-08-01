import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_screen.dart';

FavoritePlacesWM defaultFavoritePlacesWMFactory(BuildContext context) {
  return FavoritePlacesWM(
    FavoritePlacesModel(),
  );
}

abstract interface class IFavoritePlacesWM with ThemeIModelMixin implements IWidgetModel {}

final class FavoritePlacesWM extends WidgetModel<FavoritePlacesScreen, FavoritePlacesModel>
    with ThemeWMMixin
    implements IFavoritePlacesWM {
  FavoritePlacesWM(super._model);
}
