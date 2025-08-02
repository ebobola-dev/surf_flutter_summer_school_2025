import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_wm.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

class SettingsScreen extends ElementaryWidget<ISettingsWM> {
  const SettingsScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultSettingsWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(ISettingsWM wm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // SizedBox(
        //   height: kToolbarHeight,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     child: Center(
        //       child: Text(
        //         'Настройки',
        //         style: wm.textScheme.subtitle.copyWith(color: wm.colorScheme.text),
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            children: [
              ValueListenableBuilder(
                valueListenable: wm.isDarkTheme,
                builder: (_, isDarkTheme, _) {
                  return SwitchListTile(
                    value: isDarkTheme,
                    onChanged: (_) => wm.onSwitchThemeTap(),
                    title: Text('Тёмная тема'),
                  );
                },
              ),
              const _MyDivider(),
              ListTile(
                onTap: wm.onShowTutorialTap,
                title: Text('Смотреть туториал'),
                trailing: SvgPicture.asset(
                  SvgIcons.info,
                  colorFilter: ColorFilter.mode(wm.colorScheme.primary, BlendMode.srcIn),
                ),
              ),
              const _MyDivider(),
            ],
          ),
        ),
      ],
    );
  }
}

class _MyDivider extends StatelessWidget {
  const _MyDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 1,
        child: ColoredBox(color: context.appColorScheme.inactiveBlack),
      ),
    );
  }
}
