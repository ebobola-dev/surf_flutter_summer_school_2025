import 'package:surf_flutter_summer_school_2025/assets/resources.dart';

enum Categories {
  hotel(
    ruName: 'Отель',
    iconPath: SvgIcons.hotel,
  ),
  restourant(
    ruName: 'Ресторан',
    iconPath: SvgIcons.restourant,
  ),
  other(
    ruName: 'Другое',
    iconPath: SvgIcons.particularPlace,
  ),
  park(
    ruName: 'Парк',
    iconPath: SvgIcons.park,
  ),
  museum(
    ruName: 'Музей',
    iconPath: SvgIcons.museum,
  ),
  cafe(
    ruName: 'Кафе',
    iconPath: SvgIcons.cafe,
  );

  final String ruName;
  final String iconPath;
  const Categories({
    required this.ruName,
    required this.iconPath,
  });
}
