import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/error_view.dart';
import 'package:surf_flutter_summer_school_2025/features/common/presentation/widgets/place_card_widget.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';

class PlacesListView extends StatelessWidget {
  final IPlacesWM wm;
  const PlacesListView({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: wm.onRefreshPlaces,
      child: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        controller: wm.placesScrollController,
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
                        actions: [
                          IconButton(
                            onPressed: () => wm.onPlaceLikeTap(place.id),
                            icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 150),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeIn,
                              transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                              child: SvgPicture.asset(
                                place.isFavorite ? SvgIcons.heartFilled : SvgIcons.heart,
                                key: ValueKey(place.isFavorite),
                                colorFilter: ColorFilter.mode(wm.colorScheme.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
