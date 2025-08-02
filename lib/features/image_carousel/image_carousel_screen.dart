import 'package:auto_route/auto_route.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/assets/resources.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/uikit/colors/app_color_scheme.dart';
import 'package:surf_flutter_summer_school_2025/uikit/text/app_text_scheme.dart';

@RoutePage()
class ImageCarouselScreen extends StatefulWidget {
  final List<String> imageUrls;
  const ImageCarouselScreen({required this.imageUrls, super.key});

  @override
  State<ImageCarouselScreen> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  final _pageController = PageController();
  final _currentPage = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentPage.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int newPage) {
    _currentPage.emit(newPage);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColorScheme;
    final textScheme = context.appTextScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (_, currentPage, _) {
            return Text('${_currentPage.value + 1}/${widget.imageUrls.length}');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => context.read<AppRouter>().pop(),
              icon: SvgPicture.asset(
                SvgIcons.crossBig,
                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: widget.imageUrls
            .map(
              (url) => FastCachedImage(
                url: url,
                loadingBuilder: (_, __) => Center(child: CircularProgressIndicator.adaptive()),
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Text(
                    'Не удалось загрузить фото',
                    style: textScheme.small.copyWith(color: colorScheme.inactiveBlack),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
