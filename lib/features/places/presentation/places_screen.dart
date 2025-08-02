import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/error_view.dart';
import 'package:surf_flutter_summer_school_2025/features/common/presentation/widgets/place_card_widget.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/uikit/fields/app_text_field.dart';

class PlacesScreen extends ElementaryWidget<IPlacesWM> {
  const PlacesScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultPlacesWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IPlacesWM wm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Список интересных мест',
                style: wm.textScheme.subtitle.copyWith(color: wm.colorScheme.text),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: AppTextField(
            controller: wm.searchTextController,
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
            suffixIcon: GestureDetector(
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
          ),
        ),
        Expanded(
          child: RefreshIndicator.adaptive(
            onRefresh: wm.onRefresh,
            child: CustomScrollView(
              slivers: [
                ValueListenableBuilder(
                  valueListenable: wm.isLoading,
                  builder: (_, isLoading, __) => ValueListenableBuilder(
                    valueListenable: wm.placesMap,
                    builder: (_, placesMap, __) {
                      if (placesMap == null) {
                        if (isLoading) {
                          return SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        return SliverFillRemaining(
                          child: ErrorView(),
                        );
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        sliver: SliverList.separated(
                          itemCount: placesMap.length,
                          separatorBuilder: (_, __) => SizedBox(height: 24),
                          itemBuilder: (context, index) {
                            final place = placesMap.getByIndex(index)!;
                            return PlaceCardWidget(
                              key: ValueKey(place.id),
                              place: place.place,
                              onTap: () => wm.onPlaceTap(place.id),
                              onLikeTap: () => wm.onPlaceLikeTap(place.id),
                              isFavorite: place.isFavorite,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
