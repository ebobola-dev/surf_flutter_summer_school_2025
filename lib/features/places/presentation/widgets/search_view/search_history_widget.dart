import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_wm.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/history_item_card.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class SearchHistoryWidget extends StatelessWidget {
  final IPlacesWM wm;
  const SearchHistoryWidget({required this.wm, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;

    return ValueListenableBuilder(
      valueListenable: wm.searchHistory,
      builder: (_, searchHistory, _) {
        if (searchHistory.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'История поиска пуста',
                  style: textScheme.subtitle.copyWith(color: colorScheme.secondary2),
                ),
                const SizedBox(height: 8),
                Text(
                  'Вы ещё ничего не искали',
                  style: textScheme.small.copyWith(color: colorScheme.secondary2),
                ),
              ],
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                'Вы искали'.toUpperCase(),
                style: textScheme.superSmall.copyWith(color: colorScheme.inactiveBlack),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: searchHistory.length,
                separatorBuilder: (context, index) => const Divider(
                  indent: 16,
                  endIndent: 16,
                  height: 1,
                ),
                itemBuilder: (_, index) => HistoryItemCard(
                  item: searchHistory[index].query,
                  onTap: () => wm.onSearchedItemTap(searchHistory[index].query),
                  onRemoveTap: () => wm.onSearchedItemDeleteTap(searchHistory[index].query),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: wm.onClearSearchHistoryTap,
                  child: Text('Очистить историю'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
