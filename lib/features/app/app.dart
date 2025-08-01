import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/theme_mode/presentation/widgets/theme_mode_builder.dart';
import 'package:surf_flutter_summer_school_2025/uikit/theme/app_theme_data.dart';

/// {@template app.class}
/// Application.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app.class}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _appRouter = context.read<AppRouter>();
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (_, themeMode) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
