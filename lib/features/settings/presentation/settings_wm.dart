import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_model.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_screen.dart';

SettingsWM defaultSettingsWMFactory(BuildContext context) {
  return SettingsWM(
    SettingsModel(),
  );
}

abstract interface class ISettingsWM with ThemeIModelMixin implements IWidgetModel {}

final class SettingsWM extends WidgetModel<SettingsScreen, SettingsModel> with ThemeWMMixin implements ISettingsWM {
  SettingsWM(super._model);
}
