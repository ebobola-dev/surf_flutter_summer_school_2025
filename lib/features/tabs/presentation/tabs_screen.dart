import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/map/presentation/map_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/widgets/nav_bar_widget.dart';

@RoutePage()
class TabsScreen extends ElementaryWidget<ITabsWM> {
  const TabsScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultTabsWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(ITabsWM wm) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: wm.currentPage,
          builder: (_, currentPage, _) {
            return IndexedStack(
              index: currentPage,
              children: [
                const PlacesScreen(),
                const MapScreen(),
                const FavoritePlacesScreen(),
                const SettingsScreen(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: NavBarWidget(wm: wm),
    );
  }
}
