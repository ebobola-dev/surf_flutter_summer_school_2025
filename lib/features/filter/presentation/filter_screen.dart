import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/filters.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/widgets/categories_widget.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/widgets/distance_widget.dart';

@RoutePage()
class FilterScreen extends ElementaryWidget<IFilterWM> {
  FilterScreen({
    required FilterSettings initialSettings,
    super.key,
  }) : super((context) => defaultFilterWMFactory(context, initialSettings: initialSettings));

  @override
  Widget build(IFilterWM wm) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: wm.onPopInvokedWithResult,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: wm.onBackTap,
            icon: SvgPicture.asset(
              SvgIcons.arrowLeft,
              colorFilter: ColorFilter.mode(wm.colorScheme.onBackground, BlendMode.srcIn),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(onPressed: wm.onClearTap, child: Text('Отчистить')),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CategoriesWidget(wm: wm),
                        const SizedBox(height: 56),
                        DistanceFilterWidget(wm: wm),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Показать (???)'.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
