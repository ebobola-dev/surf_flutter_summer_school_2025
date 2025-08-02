import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/widgets/error_view.dart';
import 'package:surf_flutter_summer_school_2025/features/place_detail/place_detail_wm.dart';
import 'package:surf_flutter_summer_school_2025/uikit/buttons/square_button.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';

@RoutePage()
class PlaceDetailScreen extends ElementaryWidget<IPlaceDetailWM> {
  PlaceDetailScreen({
    required int placeId,
    super.key,
  }) : super((context) => defaultPlaceDetailWMFactory(context, placeId: placeId));

  @override
  Widget build(IPlaceDetailWM wm) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: RefreshIndicator.adaptive(
              onRefresh: wm.onRefresh,
              child: ValueListenableBuilder(
                valueListenable: wm.isLoading,
                builder: (_, isLoading, __) => ValueListenableBuilder(
                  valueListenable: wm.place,
                  builder: (_, place, _) {
                    if (place == null) {
                      if (isLoading) {
                        return Center(child: CircularProgressIndicator.adaptive());
                      }
                      return CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: Center(child: ErrorView()),
                          ),
                        ],
                      );
                    }
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          expandedHeight: wm.imageHeight,
                          automaticallyImplyLeading: false,
                          pinned: true,
                          backgroundColor: wm.colorScheme.background,
                          flexibleSpace: FlexibleSpaceBar(
                            background: place.place.imageUrls.isEmpty
                                ? Center(
                                    child: Text(
                                      'Нет фото',
                                      style: wm.textScheme.small.copyWith(color: wm.colorScheme.inactiveBlack),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: wm.onImageTap,
                                    child: FastCachedImage(
                                      url: place.place.imageUrls.first,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (_, __) => Center(child: CircularProgressIndicator.adaptive()),
                                      errorBuilder: (context, error, stackTrace) => Center(
                                        child: Text(
                                          'Не удалось загрузить фото',
                                          style: wm.textScheme.small.copyWith(color: wm.colorScheme.inactiveBlack),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place.place.name,
                                      style: wm.textScheme.title.copyWith(color: wm.colorScheme.text),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      place.place.placeType.ruName.toLowerCase(),
                                      style: wm.textScheme.button.copyWith(color: wm.colorScheme.text),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  place.place.description,
                                  style: wm.textScheme.small,
                                ),
                                const SizedBox(height: 24),
                                const Divider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _ActionButton(
                                        iconPath: SvgIcons.share,
                                        text: 'Поделиться',
                                        onTap: wm.onShareTap,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: _ActionButton(
                                        iconPath: place.isFavorite ? SvgIcons.heartFilled : SvgIcons.heart,
                                        text: place.isFavorite ? 'В избранное' : 'В избранном',
                                        onTap: wm.onLikeTap,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: SquareButton(
                  onTap: wm.onBackTap,
                  icon: SvgPicture.asset(
                    SvgIcons.arrowLeft,
                    colorFilter: ColorFilter.mode(wm.colorScheme.onBackground, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  const _ActionButton({required this.text, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final foregroundColor = context.appColorScheme.onBackground;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        foregroundColor: foregroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
              key: ValueKey(iconPath),
            ),
          ),
          // SvgPicture.asset(
          //   iconPath,
          //   colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
          // ),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
