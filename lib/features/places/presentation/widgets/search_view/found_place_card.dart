import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/features/places/domain/entities/found_place.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

class FoundPlaceCard extends StatelessWidget {
  final FoundPlaceEntity foundPlace;
  final VoidCallback onTap;
  const FoundPlaceCard({
    required this.foundPlace,
    required this.onTap,
    super.key,
  });

  static const _cardHeight = 78.0;
  static const _imageHeight = _cardHeight - 24;

  @override
  Widget build(BuildContext context) {
    final place = foundPlace.place;
    final textScheme = context.appTextScheme;
    final colorScheme = context.appColorScheme;

    return SizedBox(
      height: _cardHeight,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: _imageHeight,
                height: _imageHeight,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: (place.imageUrls.isEmpty)
                      ? Image.asset(
                          Images.placeholderImage,
                          fit: BoxFit.cover,
                        )
                      : FastCachedImage(
                          url: place.imageUrls.first,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, __) => Center(child: CircularProgressIndicator.adaptive()),
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            Images.placeholderImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name,
                      style: textScheme.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      place.placeType.ruName,
                      style: textScheme.small.copyWith(color: colorScheme.secondary2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
