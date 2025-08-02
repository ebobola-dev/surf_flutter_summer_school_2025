import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_2025/common/mixin/theme_wm_mixin.dart';
import 'package:surf_flutter_summer_school_2025/features/common/di/places_scope.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/navigation/app_router.dart';
import 'package:surf_flutter_summer_school_2025/features/place_detail/place_detail_model.dart';
import 'package:surf_flutter_summer_school_2025/features/place_detail/place_detail_screen.dart';

PlaceDetailWM defaultPlaceDetailWMFactory(BuildContext context, {required int placeId}) {
  final placesScope = context.read<IPlacesScope>();
  final appRouter = context.read<AppRouter>();
  return PlaceDetailWM(
    PlaceDetailModel(
      placeId: placeId,
      placesRepository: placesScope.placesRepository,
    ),
    appRouter: appRouter,
  );
}

abstract interface class IPlaceDetailWM with ThemeIModelMixin implements IWidgetModel {
  ScrollController get scrollController;
  ValueListenable<bool> get isLoading;
  ValueListenable<FavoritePlaceEntity?> get place;
  double get imageHeight;

  void onBackTap();
  Future<void> onRefresh();
  void onImageTap();
  void onShareTap();
  void onLikeTap();
}

final class PlaceDetailWM extends WidgetModel<PlaceDetailScreen, PlaceDetailModel>
    with ThemeWMMixin
    implements IPlaceDetailWM {
  PlaceDetailWM(
    super._model, {
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  final scrollController = ScrollController();

  late final StreamSubscription<String> _errorSubscription;

  @override
  void initWidgetModel() {
    _errorSubscription = model.errorsStream.listen(_errorListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _errorSubscription.cancel();
    scrollController.dispose();
    super.dispose();
  }

  @override
  ValueListenable<bool> get isLoading => model.isLoading;

  @override
  ValueListenable<FavoritePlaceEntity?> get place => model.place;

  @override
  double get imageHeight => MediaQuery.of(context).size.height * .5;

  @override
  void onBackTap() => _appRouter.pop();

  @override
  Future<void> onRefresh() async {
    if (model.isLoading.value) return;
    unawaited(model.refresh());
    final completer = Completer<void>();
    void loadedListener() {
      if (!model.isLoading.value) {
        completer.complete();
      }
    }

    model.isLoading.addListener(loadedListener);
    await completer.future;
    model.isLoading.removeListener(loadedListener);
  }

  @override
  void onImageTap() {
    if (model.place.value == null) return;
    final imageUrls = model.place.value!.place.imageUrls;
    if (imageUrls.isEmpty) return;
    // TODO(navigate): navigate to carousel screen
  }

  @override
  void onShareTap() {}

  @override
  void onLikeTap() => model.toggleLike();

  void _errorListener(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}
