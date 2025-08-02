import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_model.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/theme_mode/presentation/theme_mode_controller.dart';

SettingsWM defaultSettingsWMFactory(BuildContext context) {
  final themeModeController = context.read<ThemeModeController>();
  return SettingsWM(
    SettingsModel(),
    themeModeController: themeModeController,
  );
}

abstract interface class ISettingsWM with ThemeIModelMixin implements IWidgetModel {
  ValueListenable<bool> get isDarkTheme;

  void onSwitchThemeTap();
  void onShowTutorialTap();
}

final class SettingsWM extends WidgetModel<SettingsScreen, SettingsModel> with ThemeWMMixin implements ISettingsWM {
  SettingsWM(
    super._model, {
    required ThemeModeController themeModeController,
  }) : _themeModeController = themeModeController;

  final ThemeModeController _themeModeController;
  late final ValueNotifier<bool> _isDarkTheme;

  @override
  void initWidgetModel() {
    _isDarkTheme = ValueNotifier(_themeModeController.themeMode.value == ThemeMode.dark);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _isDarkTheme.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _isDarkTheme.emit(Theme.of(context).brightness == Brightness.dark);
    super.didChangeDependencies();
  }

  @override
  ValueListenable<bool> get isDarkTheme => _isDarkTheme;

  @override
  void onSwitchThemeTap() => _themeModeController.switchThemeMode();

  @override
  void onShowTutorialTap() {}
}
