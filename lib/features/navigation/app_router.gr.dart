// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<FilterRouteArgs> {
  FilterRoute({
    required FilterSettings initialSettings,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         FilterRoute.name,
         args: FilterRouteArgs(initialSettings: initialSettings, key: key),
         initialChildren: children,
       );

  static const String name = 'FilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilterRouteArgs>();
      return FilterScreen(initialSettings: args.initialSettings, key: args.key);
    },
  );
}

class FilterRouteArgs {
  const FilterRouteArgs({required this.initialSettings, this.key});

  final FilterSettings initialSettings;

  final Key? key;

  @override
  String toString() {
    return 'FilterRouteArgs{initialSettings: $initialSettings, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FilterRouteArgs) return false;
    return initialSettings == other.initialSettings && key == other.key;
  }

  @override
  int get hashCode => initialSettings.hashCode ^ key.hashCode;
}

/// generated route for
/// [ImageCarouselScreen]
class ImageCarouselRoute extends PageRouteInfo<ImageCarouselRouteArgs> {
  ImageCarouselRoute({
    required List<String> imageUrls,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ImageCarouselRoute.name,
         args: ImageCarouselRouteArgs(imageUrls: imageUrls, key: key),
         initialChildren: children,
       );

  static const String name = 'ImageCarouselRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageCarouselRouteArgs>();
      return ImageCarouselScreen(imageUrls: args.imageUrls, key: args.key);
    },
  );
}

class ImageCarouselRouteArgs {
  const ImageCarouselRouteArgs({required this.imageUrls, this.key});

  final List<String> imageUrls;

  final Key? key;

  @override
  String toString() {
    return 'ImageCarouselRouteArgs{imageUrls: $imageUrls, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageCarouselRouteArgs) return false;
    return const ListEquality().equals(imageUrls, other.imageUrls) &&
        key == other.key;
  }

  @override
  int get hashCode => const ListEquality().hash(imageUrls) ^ key.hashCode;
}

/// generated route for
/// [OnboardingFlow]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const OnboardingFlow());
    },
  );
}

/// generated route for
/// [PlaceDetailScreen]
class PlaceDetailRoute extends PageRouteInfo<PlaceDetailRouteArgs> {
  PlaceDetailRoute({
    required int placeId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         PlaceDetailRoute.name,
         args: PlaceDetailRouteArgs(placeId: placeId, key: key),
         initialChildren: children,
       );

  static const String name = 'PlaceDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PlaceDetailRouteArgs>();
      return PlaceDetailScreen(placeId: args.placeId, key: args.key);
    },
  );
}

class PlaceDetailRouteArgs {
  const PlaceDetailRouteArgs({required this.placeId, this.key});

  final int placeId;

  final Key? key;

  @override
  String toString() {
    return 'PlaceDetailRouteArgs{placeId: $placeId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceDetailRouteArgs) return false;
    return placeId == other.placeId && key == other.key;
  }

  @override
  int get hashCode => placeId.hashCode ^ key.hashCode;
}

/// generated route for
/// [SplashFlow]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SplashFlow());
    },
  );
}

/// generated route for
/// [TabsScreen]
class TabsRoute extends PageRouteInfo<TabsRouteArgs> {
  TabsRoute({
    Key? key,
    WidgetModelFactory<
          WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel>
        >
        wmFactory =
        defaultTabsWMFactory,
    List<PageRouteInfo>? children,
  }) : super(
         TabsRoute.name,
         args: TabsRouteArgs(key: key, wmFactory: wmFactory),
         initialChildren: children,
       );

  static const String name = 'TabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TabsRouteArgs>(
        orElse: () => const TabsRouteArgs(),
      );
      return TabsScreen(key: args.key, wmFactory: args.wmFactory);
    },
  );
}

class TabsRouteArgs {
  const TabsRouteArgs({this.key, this.wmFactory = defaultTabsWMFactory});

  final Key? key;

  final WidgetModelFactory<
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel>
  >
  wmFactory;

  @override
  String toString() {
    return 'TabsRouteArgs{key: $key, wmFactory: $wmFactory}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TabsRouteArgs) return false;
    return key == other.key && wmFactory == other.wmFactory;
  }

  @override
  int get hashCode => key.hashCode ^ wmFactory.hashCode;
}
