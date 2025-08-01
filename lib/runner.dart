import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter_summer_school_2025/features/app/app_flow.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope_register.dart';

/// App launch.
Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await _runApp();
}

Future<void> _runApp() async {
  const scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope();

  runApp(AppFlow(appScope: scope));
}
