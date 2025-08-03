import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/places_list_view.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_field.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/search_view.dart';

class PlacesScreen extends ElementaryWidget<IPlacesWM> {
  const PlacesScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultPlacesWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IPlacesWM wm) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PlacesSearchField(wm: wm),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: wm.showSearch,
            builder: (_, showSearch, _) {
              if (showSearch) {
                return PlacesSearchView(wm: wm);
              }
              return PlacesListView(wm: wm);
            },
          ),
        ),
      ],
    );
  }
}
