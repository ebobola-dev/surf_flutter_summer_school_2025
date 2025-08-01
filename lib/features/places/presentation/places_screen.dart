import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';

class PlacesScreen extends ElementaryWidget<IPlacesWM> {
  const PlacesScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultPlacesWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IPlacesWM wm) {
    return Center(
      child: Text('Places Screen'),
    );
  }
}
