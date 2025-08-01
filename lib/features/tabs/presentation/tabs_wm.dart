import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_model.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_screen.dart';

TabsWM defaultTabsWMFactory(BuildContext context) {
  return TabsWM(
    TabsModel(),
  );
}

const defaultPage = 0;

abstract interface class ITabsWM with ThemeIModelMixin implements IWidgetModel {
  PageController get pageController;
  ValueListenable<int> get currentPage;

  void onTabBarItemTap(int index);
}

final class TabsWM extends WidgetModel<TabsScreen, TabsModel> with ThemeWMMixin implements ITabsWM {
  TabsWM(super._model);

  @override
  // ignore: avoid_redundant_argument_values
  final pageController = PageController(initialPage: defaultPage);
  final _currentPage = ValueNotifier<int>(defaultPage);

  @override
  void dispose() {
    pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  void onTabBarItemTap(int index) {
    if (_currentPage.value == index) return;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    _currentPage.emit(index);
  }

  @override
  ValueListenable<int> get currentPage => _currentPage;
}
