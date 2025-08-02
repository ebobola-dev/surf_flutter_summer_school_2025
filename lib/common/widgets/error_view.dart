import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback? onRetryTap;
  const ErrorView({super.key, this.onRetryTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgIcons.crossCircle,
            width: 64,
            height: 64,
          ),
          const SizedBox(height: 24),
          Text(
            'Ошибка',
            textAlign: TextAlign.center,
            style: textScheme.subtitle.copyWith(color: colorScheme.inactiveBlack),
          ),
          const SizedBox(height: 8),
          Text(
            'Что-то пошло не так\nПопробуйте позже',
            textAlign: TextAlign.center,
            style: textScheme.small.copyWith(color: colorScheme.inactiveBlack),
          ),
          if (onRetryTap != null) ...[
            const SizedBox(height: 8),
            TextButton(onPressed: onRetryTap, child: Text('Обновить')),
          ],
        ],
      ),
    );
  }
}
