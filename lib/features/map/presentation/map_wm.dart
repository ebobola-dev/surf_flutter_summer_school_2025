import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/features/map/presentation/map_model.dart';
import 'package:surf_flutter_summer_school_2025/features/map/presentation/map_screen.dart';

MapWM defaultMapWMFactory(BuildContext context) {
  return MapWM(
    MapModel(),
  );
}

abstract interface class IMapWM with ThemeIModelMixin implements IWidgetModel {}

final class MapWM extends WidgetModel<MapScreen, MapModel> with ThemeWMMixin implements IMapWM {
  MapWM(super._model);
}
