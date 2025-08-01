import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_2025/features/tabs/presentation/widgets/nav_bar_item_data.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

class NavBarItem extends StatelessWidget {
  final NavBarItemData itemData;
  final bool isActive;
  final VoidCallback onTap;
  const NavBarItem({required this.itemData, required this.isActive, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    return IconButton(
      onPressed: onTap,
      icon: SvgPicture.asset(
        isActive ? itemData.activeIconPath : itemData.inactiveIconPath,
        colorFilter: ColorFilter.mode(colorScheme.onBackground, BlendMode.srcIn),
      ),
    );
  }
}
