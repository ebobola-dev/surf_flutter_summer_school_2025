import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_model.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';

PlacesWM defaultPlacesWMFactory(BuildContext context) {
  return PlacesWM(
    PlacesModel(),
  );
}

abstract interface class IPlacesWM with ThemeIModelMixin implements IWidgetModel {}

final class PlacesWM extends WidgetModel<PlacesScreen, PlacesModel> with ThemeWMMixin implements IPlacesWM {
  PlacesWM(super._model);
}
