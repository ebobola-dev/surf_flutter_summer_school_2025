import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_wm.dart';

class FavoritePlacesScreen extends ElementaryWidget<IFavoritePlacesWM> {
  const FavoritePlacesScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultFavoritePlacesWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IFavoritePlacesWM wm) {
    return Center(
      child: Text('Favorite Places Screen'),
    );
  }
}
