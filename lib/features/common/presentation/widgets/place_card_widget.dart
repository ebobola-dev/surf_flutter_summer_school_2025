import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class PlaceCardWidget extends StatelessWidget {
  final PlaceEntity place;
  final VoidCallback onTap;
  final VoidCallback onLikeTap;
  final bool isFavorite;
  const PlaceCardWidget({
    required this.place,
    required this.onTap,
    required this.onLikeTap,
    required this.isFavorite,
    super.key,
  });

  static const _cardHeight = 188.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;
    return SizedBox(
      height: _cardHeight,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: colorScheme.surface,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: place.imageUrls.isEmpty
                            ? Center(
                                child: Text(
                                  'Нет фото',
                                  style: textScheme.small.copyWith(color: colorScheme.inactiveBlack),
                                ),
                              )
                            : Image.network(
                                place.imageUrls[0],
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned.fill(child: ColoredBox(color: Colors.black.withAlpha(40))),
                      Align(
                        alignment: Alignment(-.9, -.6),
                        child: Text(
                          place.placeType.ruName,
                          style: textScheme.smallBold.copyWith(color: colorScheme.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          place.name,
                          style: textScheme.textMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          place.description,
                          style: textScheme.small.copyWith(color: colorScheme.inactiveBlack),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onTap),
              ),
            ),
            Align(
              alignment: Alignment(.97, -.97),
              child: IconButton(
                onPressed: onLikeTap,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                  child: SvgPicture.asset(
                    isFavorite ? SvgIcons.heartFilled : SvgIcons.heart,
                    key: ValueKey(isFavorite),
                    colorFilter: ColorFilter.mode(colorScheme.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
