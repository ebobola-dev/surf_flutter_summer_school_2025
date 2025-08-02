import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place_type.dart';

enum Categories {
  hotel(
    placeType: PlaceTypeEntity.hotel,
    iconPath: SvgIcons.hotel,
  ),
  restourant(
    placeType: PlaceTypeEntity.restaurant,
    iconPath: SvgIcons.restourant,
  ),
  other(
    placeType: PlaceTypeEntity.other,
    iconPath: SvgIcons.particularPlace,
  ),
  park(
    placeType: PlaceTypeEntity.park,
    iconPath: SvgIcons.park,
  ),
  museum(
    placeType: PlaceTypeEntity.museum,
    iconPath: SvgIcons.museum,
  ),
  cafe(
    placeType: PlaceTypeEntity.cafe,
    iconPath: SvgIcons.cafe,
  );

  final PlaceTypeEntity placeType;
  final String iconPath;
  const Categories({
    required this.placeType,
    required this.iconPath,
  });
}
