import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/features/settings/presentation/settings_wm.dart';

class SettingsScreen extends ElementaryWidget<ISettingsWM> {
  const SettingsScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultSettingsWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(ISettingsWM wm) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
