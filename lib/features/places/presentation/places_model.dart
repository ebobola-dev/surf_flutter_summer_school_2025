import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/stream_controller.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/failure/api_failure.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/result.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/core/presentation/base_model.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';

final class PlacesModel extends BaseModel {
  PlacesModel({
    required super.logWriter,
    required IPlacesRepository placesRepository,
  }) : _repository = placesRepository;

  final IPlacesRepository _repository;
  late final StreamSubscription<List<FavoritePlaceEntity>> _favoritesSubscription;
  final _isLoading = ValueNotifier<bool>(false);
  final _placesMap = ValueNotifier<SortedMap<int, FavoritePlaceEntity>?>(null);
  final _errorsController = StreamController<String>();
  Map<int, FavoritePlaceEntity> _favoritesMap = <int, FavoritePlaceEntity>{};

  ValueListenable<bool> get isLoading => _isLoading;
  ValueListenable<SortedMap<int, FavoritePlaceEntity>?> get placesMap => _placesMap;
  Stream<String> get errorsStream => _errorsController.stream;

  @override
  void init() {
    _favoritesSubscription = _repository.favoritesStream.listen(_favoritesListener);
    unawaited(_initFavorites());
    unawaited(refresh());
    super.init();
  }

  @override
  void dispose() {
    _isLoading.dispose();
    _placesMap.dispose();
    _errorsController.close();
    _favoritesSubscription.cancel();
    super.dispose();
  }

  void _favoritesListener(List<FavoritePlaceEntity> favorites) {
    _favoritesMap = {for (final fp in favorites) fp.id: fp};
    _combineFavorites();
  }

  Future<void> _initFavorites() async {
    final result = await makeCall(_repository.getFavoritePlaces);
    switch (result) {
      case ResultOk(:final data):
        {
          _favoritesMap = {for (final fp in data) fp.id: fp};
        }
      case ResultFailed():
        _errorsController.safeAdd('Не удалось получить избранные');
    }
  }

  void _combineFavorites() {
    if (_placesMap.value != null) {
      _placesMap.emit(_convert(_placesMap.value!.data.entries.map((entry) => entry.value.place).toList()));
    }
  }

  SortedMap<int, FavoritePlaceEntity> _convert(List<PlaceEntity> places) {
    return SortedMap.fromList(
      list: places.map((p) {
        final favoritePlace = _favoritesMap[p.id];
        return FavoritePlaceEntity(
          place: p,
          likedAt: favoritePlace?.likedAt,
        );
      }).toList(),
      getId: (p) => p.place.id,
    );
  }

  Future<void> refresh() async {
    if (_isLoading.value) return;
    _isLoading.emit(true);
    final placesResult = await _repository.fetchAllPlaces();
    switch (placesResult) {
      case ResultOk(:final data):
        {
          _placesMap.emit(_convert(data));
        }
      case ResultFailed(:final failure):
        {
          final message = switch (failure) {
            ApiFailure(:final errorMessage) => errorMessage,
            _ => 'Ошибка',
          };
          _errorsController.safeAdd(message);
        }
    }
    _isLoading.emit(false);
  }

  Future<void> toggleLike(int placeId) async {
    final isFavorite = await makeCall(() => _repository.isFavorite(placeId));
    switch (isFavorite) {
      case ResultFailed():
        _errorsController.safeAdd('Ошибка');
      case ResultOk(:final data):
        {
          if (data) {
            final result = await makeCall(() => _repository.unlikePlace(placeId));
            if (result case ResultFailed()) {
              _errorsController.safeAdd('Ошибка');
            }
          } else {
            final place = _placesMap.value?.data[placeId]?.place;
            if (place == null) return;
            final result = await makeCall(() => _repository.likePlace(place));
            if (result case ResultFailed()) {
              _errorsController.safeAdd('Ошибка');
            }
          }
        }
    }
  }
}
