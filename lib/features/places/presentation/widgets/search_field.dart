import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/uikit/fields/app_text_field.dart';

class PlacesSearchField extends StatelessWidget {
  final IPlacesWM wm;
  const PlacesSearchField({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: wm.searchTextController,
      focusNode: wm.searchFocusNode,
      hintText: 'Поиск',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          SvgIcons.search,
          colorFilter: ColorFilter.mode(
            wm.colorScheme.inactiveBlack,
            BlendMode.srcIn,
          ),
        ),
      ),
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            child: ValueListenableBuilder(
              valueListenable: wm.showSearch,
              builder: (_, showSearch, _) {
                return AnimatedSlide(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  offset: showSearch ? Offset.zero : Offset(1, 0),
                  child: GestureDetector(
                    onTap: wm.onCloseSearchTap,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: wm.colorScheme.onBackground,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          SvgIcons.crossSmall,
                          colorFilter: ColorFilter.mode(
                            wm.colorScheme.surface,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: wm.onFilterTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ValueListenableBuilder(
                valueListenable: wm.filtersModified,
                builder: (_, filtersModified, __) {
                  return SvgPicture.asset(
                    SvgIcons.filter,
                    colorFilter: ColorFilter.mode(
                      filtersModified ? wm.colorScheme.primary : wm.colorScheme.inactiveBlack,
                      BlendMode.srcIn,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
