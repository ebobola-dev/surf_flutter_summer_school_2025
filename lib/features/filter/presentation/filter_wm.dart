import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/categories.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/distance.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/filters.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_model.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';

FilterWM defaultFilterWMFactory(
  BuildContext context, {
  required FilterSettings initialSettings,
}) {
  final appRouter = context.read<AppRouter>();

  return FilterWM(
    FilterModel(),
    appRouter: appRouter,
    initialSettings: initialSettings,
  );
}

abstract interface class IFilterWM with ThemeIModelMixin implements IWidgetModel {
  ValueListenable<FilterSettings> get filters;

  void onBackTap();
  void onClearTap();
  void onCategoryTap(Categories category);
  void onDistanceChanged(int newMin, int newMax);
  // ignore: avoid_positional_boolean_parameters
  void onPopInvokedWithResult(bool didPop, Object? result);
}

final class FilterWM extends WidgetModel<FilterScreen, FilterModel> with ThemeWMMixin implements IFilterWM {
  final AppRouter _appRouter;
  final ValueNotifier<FilterSettings> _filters;

  FilterWM(
    super._model, {
    required AppRouter appRouter,
    required FilterSettings initialSettings,
  }) : _filters = ValueNotifier(initialSettings),
       _appRouter = appRouter;

  @override
  void dispose() {
    _filters.dispose();
    super.dispose();
  }

  @override
  ValueListenable<FilterSettings> get filters => _filters;

  @override
  void onBackTap() {
    _appRouter.pop(_filters.value);
  }

  @override
  void onClearTap() {
    _filters.emit(FilterSettings.base());
  }

  @override
  void onCategoryTap(Categories category) {
    final currentCategories = _filters.value.categories;
    final Set<Categories> newCategories;
    if (currentCategories.contains(category)) {
      if (currentCategories.length == 1) return;
      newCategories = {...currentCategories}..remove(category);
    } else {
      newCategories = {...currentCategories, category};
    }
    _filters.emit(_filters.value.copyWith(categories: newCategories));
  }

  @override
  void onDistanceChanged(int newMin, int newMax) {
    _filters.emit(
      _filters.value.copyWith(
        distance: DistanceFilter(min: newMin, max: newMax),
      ),
    );
  }

  @override
  void onPopInvokedWithResult(bool didPop, Object? result) {
    if (!didPop) {
      _appRouter.pop(_filters.value);
    }
  }
}
