import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/map/presentation/map_wm.dart';

class MapScreen extends ElementaryWidget<IMapWM> {
  const MapScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultMapWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IMapWM wm) {
    return Center(
      child: Text(
        'Экран карты ещё не реализован',
        style: wm.textScheme.subtitle,
      ),
    );
  }
}
