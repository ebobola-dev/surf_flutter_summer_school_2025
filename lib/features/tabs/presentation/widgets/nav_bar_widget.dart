import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/smart_value_listener_builder.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/widgets/nav_bar_item.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/widgets/nav_bar_item_data.dart';

const _items = [
  NavBarItemData(activeIconPath: SvgIcons.listFilled, inactiveIconPath: SvgIcons.list),
  NavBarItemData(activeIconPath: SvgIcons.mapFilled, inactiveIconPath: SvgIcons.map),
  NavBarItemData(activeIconPath: SvgIcons.heartFilled, inactiveIconPath: SvgIcons.heart),
  NavBarItemData(activeIconPath: SvgIcons.settingsFilled, inactiveIconPath: SvgIcons.settings),
];

class NavBarWidget extends StatelessWidget {
  final ITabsWM wm;
  const NavBarWidget({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _items.length,
            (index) => SmartValueListenableBuilder(
              listenable: wm.currentPage,
              buildWhen: (previous, current) {
                return (previous == index) != (current == index);
              },
              builder: (_, currentPage) {
                return NavBarItem(
                  itemData: _items[index],
                  isActive: currentPage == index,
                  onTap: () => wm.onTabBarItemTap(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
