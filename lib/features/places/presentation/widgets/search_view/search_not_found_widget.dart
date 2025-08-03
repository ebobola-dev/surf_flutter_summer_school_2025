import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textScheme = context.appTextScheme;
    final color = context.appColorScheme.inactiveBlack;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgIcons.search,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            width: 64,
          ),
          const SizedBox(height: 24),
          Text(
            'Ничего не найдено.',
            style: textScheme.subtitle.copyWith(color: color),
          ),
          const SizedBox(height: 8),
          Text(
            'Попробуйте изменить параметры поиска',
            style: textScheme.small.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
