import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/error_view.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/search_state.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/search_found_view.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/search_history_widget.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/search_not_found_widget.dart';

class PlacesSearchView extends StatelessWidget {
  final IPlacesWM wm;
  const PlacesSearchView({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: wm.onRefreshSearch,
      child: ValueListenableBuilder(
        valueListenable: wm.searchState,
        builder: (_, searchState, __) {
          final enableScroll = switch (searchState) {
            BaseSearchState() || ProcessingSearchState() => false,
            _ => true,
          };
          return CustomScrollView(
            controller: wm.searchScrollController,
            physics: enableScroll ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
            slivers: [
              Builder(
                builder: (context) {
                  switch (searchState) {
                    case BaseSearchState():
                      return const SliverFillRemaining(child: SearchHistoryWidget());
                    case ProcessingSearchState():
                      return const SliverFillRemaining(child: Center(child: CircularProgressIndicator.adaptive()));
                    case FoundSearchState():
                      return SearchFoundView(wm: wm);
                    case NotFoundSearchState():
                      return const SliverFillRemaining(child: SearchNotFoundWidget());
                    case ErrorSearchState():
                      return const SliverFillRemaining(child: ErrorView());
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
