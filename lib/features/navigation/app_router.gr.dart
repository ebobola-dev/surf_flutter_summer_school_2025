// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
