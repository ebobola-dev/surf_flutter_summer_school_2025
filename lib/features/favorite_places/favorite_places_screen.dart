import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/error_view.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/smart_value_listener_builder.dart';
import 'package:surf_flutter_summer_school_2025/features/common/presentation/widgets/place_card_widget.dart';
import 'package:surf_flutter_summer_school_2025/features/favorite_places/favorite_places_wm.dart';

class FavoritePlacesScreen extends ElementaryWidget<IFavoritePlacesWM> {
  const FavoritePlacesScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultFavoritePlacesWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IFavoritePlacesWM wm) {
    return GestureDetector(
      onTap: wm.onOutsideTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: kToolbarHeight,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16),
          //     child: Center(
          //       child: Text(
          //         'Избранное',
          //         style: wm.textScheme.subtitle.copyWith(color: wm.colorScheme.text),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: CustomScrollView(
              controller: wm.scrollController,
              slivers: [
                ValueListenableBuilder(
                  valueListenable: wm.isLoading,
                  builder: (_, isLoading, __) => ValueListenableBuilder(
                    valueListenable: wm.favoritesMap,
                    builder: (_, placesMap, __) {
                      if (placesMap == null) {
                        if (isLoading) {
                          return SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        return SliverFillRemaining(
                          child: ErrorView(
                            onRetryTap: wm.onRefreshTap,
                          ),
                        );
                      }
                      if (placesMap.isEmpty) {
                        return SliverFillRemaining(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(SvgIcons.go),
                                const SizedBox(height: 24),
                                Text(
                                  'Пусто',
                                  textAlign: TextAlign.center,
                                  style: wm.textScheme.subtitle.copyWith(color: wm.colorScheme.inactiveBlack),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        sliver: SliverList.separated(
                          itemCount: placesMap.length,
                          separatorBuilder: (_, __) => SizedBox(height: 24),
                          itemBuilder: (context, index) {
                            final place = placesMap.getByIndex(index)!;
                            return SizedBox(
                              height: 188,
                              child: Stack(
                                key: ValueKey(place.id),
                                children: [
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: wm.colorScheme.danger,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 16),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    SvgIcons.trash,
                                                    colorFilter: ColorFilter.mode(
                                                      wm.colorScheme.onDanger,
                                                      BlendMode.srcIn,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    'Удалить',
                                                    style: wm.textScheme.superSmall.copyWith(
                                                      color: wm.colorScheme.onDanger,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: InkWell(onTap: () => wm.onPlaceDislikeConfirmTap(place.id)),
                                      ),
                                    ),
                                  ),
                                  SmartValueListenableBuilder(
                                    listenable: wm.currentDissmisedPlaceId,
                                    buildWhen: (previous, current) => (previous == place.id) != (current == place.id),
                                    builder: (_, currentDissmisedPlaceId) => AnimatedPositioned(
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                      left: currentDissmisedPlaceId == place.id ? -80 : 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: PlaceCardWidget(
                                          place: place,
                                          onTap: () => wm.onPlaceCardTap(place.id),
                                          actions: [
                                            IconButton(
                                              onPressed: () => wm.onPlaceShareTap(place.id),
                                              icon: SvgPicture.asset(SvgIcons.share),
                                            ),
                                            IconButton(
                                              onPressed: () => wm.onPlaceDislikeTap(place.id),
                                              icon: SvgPicture.asset(SvgIcons.crossBig),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
