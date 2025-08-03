import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/widgets/search_view/history_item_card.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

const _tempHistory = [
  'Кофейня у Рустама',
  'Рускеала',
  'Музей истории Российской Федерации',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
  'Зелёные рощи',
];

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;

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
            itemCount: _tempHistory.length,
            separatorBuilder: (context, index) => const Divider(
              indent: 16,
              endIndent: 16,
              height: 1,
            ),
            itemBuilder: (_, index) => HistoryItemCard(
              item: _tempHistory[index],
              onTap: () {},
              onRemoveTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text('Очистить историю'),
            ),
          ),
        ),
      ],
    );
  }
}
