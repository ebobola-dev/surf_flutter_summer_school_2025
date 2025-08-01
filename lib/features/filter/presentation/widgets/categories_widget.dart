import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/smart_value_listener_builder.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/categories.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  final IFilterWM wm;
  const CategoriesWidget({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Категории'.toUpperCase(),
          style: wm.textScheme.superSmall.copyWith(color: wm.colorScheme.inactiveBlack),
        ),
        const SizedBox(height: 24),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 40,
            childAspectRatio: 92 / 96,
          ),
          shrinkWrap: true,
          children: Categories.values
              .map(
                (c) => SmartValueListenableBuilder(
                  listenable: wm.filters,
                  buildWhen: (previous, current) => previous.categories.contains(c) != current.categories.contains(c),
                  builder: (_, filters) {
                    return CategoryItemWidget(
                      category: c,
                      isActive: filters.categories.contains(c),
                      onTap: () => wm.onCategoryTap(c),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
