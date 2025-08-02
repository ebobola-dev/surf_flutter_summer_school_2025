import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/domain/entities/filters.dart';
import 'package:surf_flutter_summer_school_2025/features/filter/presentation/filter_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_route_paths.dart';
import 'package:surf_flutter_summer_school_2025/features/onboarding/presentation/onboarding_flow.dart';
import 'package:surf_flutter_summer_school_2025/features/place_detail/place_detail_screen.dart';
import 'package:surf_flutter_summer_school_2025/features/splash/presentation/splash_flow.dart';
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
      page: SplashRoute.page,
      path: AppRoutePaths.splash,
      initial: true,
    ),
    CustomRoute(
      page: OnboardingRoute.page,
      path: AppRoutePaths.onboarding,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      duration: const Duration(milliseconds: 200),
    ),
    CustomRoute(
      page: TabsRoute.page,
      path: AppRoutePaths.tabs,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      duration: const Duration(milliseconds: 200),
    ),
    AutoRoute(
      page: FilterRoute.page,
      path: AppRoutePaths.filters,
    ),
    AutoRoute(
      page: PlaceDetailRoute.page,
      path: AppRoutePaths.placeDetail,
    ),
  ];
}
