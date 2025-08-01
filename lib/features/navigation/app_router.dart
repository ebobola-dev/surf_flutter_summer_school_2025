import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_route_paths.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/tabs_wm.dart';

part 'app_router.gr.dart';

/// Main point of the application navigation.
@AutoRouterConfig(
  replaceInRouteName: 'Flow|Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: TabsRoute.page,
      path: AppRoutePaths.tabs,
      initial: true,
    ),
  ];
}
