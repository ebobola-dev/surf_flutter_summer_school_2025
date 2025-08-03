import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class HistoryItemCard extends StatelessWidget {
  final String item;
  final VoidCallback onTap;
  final VoidCallback onRemoveTap;
  const HistoryItemCard({required this.item, required this.onTap, required this.onRemoveTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(
                  item,
                  style: textScheme.text.copyWith(color: colorScheme.secondary2),
                ),
              ),
            ),
            IconButton(
              onPressed: onRemoveTap,
              icon: SvgPicture.asset(
                SvgIcons.crossSmall,
                colorFilter: ColorFilter.mode(colorScheme.secondary2, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
