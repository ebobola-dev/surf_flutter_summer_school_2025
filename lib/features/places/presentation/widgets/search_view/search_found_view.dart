import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_state.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/found_place_card.dart';

class SearchFoundView extends StatelessWidget {
  final IPlacesWM wm;
  const SearchFoundView({
    required this.wm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: wm.searchState,
      builder: (_, searchState, _) {
        if (searchState is! FoundSearchState) {
          return SizedBox();
        }
        final resultsMap = searchState.result.results;
        final isLoadingMore = searchState.isLoadingMore;

        return SliverList.separated(
          itemCount: isLoadingMore ? resultsMap.length + 1 : resultsMap.length,
          separatorBuilder: (_, __) => Divider(
            indent: 16,
            endIndent: 16,
            height: 1,
          ),
          itemBuilder: (_, index) {
            if (index < resultsMap.length) {
              final foundPlace = resultsMap.getByIndex(index)!;
              return FoundPlaceCard(
                key: ValueKey(foundPlace.placeId),
                foundPlace: foundPlace,
                onTap: () => wm.onPlaceTap(foundPlace.placeId),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
