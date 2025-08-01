import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/di_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/app/app.dart';
import 'package:surf_flutter_summer_school_2025/features/app/di/app_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/theme_mode/presentation/theme_mode_provider.dart';

class AppFlow extends StatelessWidget {
  const AppFlow({
    required this.appScope,
    super.key,
  });

  final IAppScope appScope;

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        DiScope<IAppScope>(factory: (_) => appScope),
        ChangeNotifierProvider<AppRouter>(create: (_) => AppRouter()),
        const ThemeModeProvider(),
      ],
      child: const App(),
    );
  }
}
