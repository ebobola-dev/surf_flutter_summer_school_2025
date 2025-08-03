import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/di_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/places/di/search_places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/places/presentation/places_screen.dart';

class PlacesFlow extends StatelessWidget {
  const PlacesFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return DiScope<ISearchPlacesScope>(
      factory: SearchPlacesScope.create,
      onDispose: (scope) => scope.dispose(),
      child: const PlacesScreen(),
    );
  }
}
