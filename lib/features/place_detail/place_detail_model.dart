import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/stream_controller.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/result.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';

class PlaceDetailModel extends ElementaryModel {
  final int _placeId;
  final IPlacesRepository _repository;

  PlaceDetailModel({
    required int placeId,
    required IPlacesRepository placesRepository,
  }) : _placeId = placeId,
       _repository = placesRepository;

  late final StreamSubscription<List<FavoritePlaceEntity>> _favoritesSubscription;
  final _isLoading = ValueNotifier<bool>(false);
  final _place = ValueNotifier<FavoritePlaceEntity?>(null);
  final _errorsController = StreamController<String>();
  bool _likeInProgress = false;
  bool _disposed = false;

  ValueListenable<bool> get isLoading => _isLoading;
  ValueListenable<FavoritePlaceEntity?> get place => _place;
  Stream<String> get errorsStream => _errorsController.stream;

  @override
  void init() {
    _favoritesSubscription = _repository.favoritesStream.listen(_favoritesListener);
    refresh();
    super.init();
  }

  @override
  void dispose() {
    _disposed = true;
    _favoritesSubscription.cancel();
    _isLoading.dispose();
    _place.dispose();
    _errorsController.close();
    super.dispose();
  }

  void _favoritesListener(List<FavoritePlaceEntity> favoritesList) {
    if (place.value == null) return;
    if (_disposed) return;
    final favoritePlace = favoritesList.firstWhereOrNull((fp) => fp.id == _placeId);
    final isFavorite = favoritePlace != null;
    if (!isFavorite && _place.value!.isFavorite) {
      _place.emit(_place.value!.copyWith(likedAt: null));
    }
    if (isFavorite && !place.value!.isFavorite) {
      _place.emit(_place.value!.copyWith(likedAt: favoritePlace.likedAt));
    }
  }

  Future<void> refresh() async {
    _isLoading.emit(true);
    final result = await _repository.fetchOnePlace(_placeId);
    switch (result) {
      case ResultOk(:final data):
        {
          final placeData = data;
          final favResult = await _repository.getFavorite(_placeId);
          if (_disposed) return;
          switch (favResult) {
            case ResultOk(:final data):
              {
                _place.emit(FavoritePlaceEntity(place: placeData, likedAt: data?.likedAt));
              }
            case ResultFailed():
              {
                _errorsController.safeAdd('Не удалось получить избранные');
                _place.emit(FavoritePlaceEntity(place: placeData, likedAt: null));
              }
          }
        }
      case ResultFailed():
        {
          _errorsController.safeAdd('Не удалось получить данные места');
        }
    }
    _isLoading.emit(false);
  }

  Future<void> toggleLike() async {
    if (_place.value == null) return;
    if (_likeInProgress) return;
    _likeInProgress = true;
    if (_place.value!.isFavorite) {
      final unlike = await _repository.unlikePlace(_placeId);
      if (_disposed) return;
      if (unlike case ResultFailed()) {
        _errorsController.safeAdd('Ошибка');
      }
    } else {
      final likeResult = await _repository.likePlace(_place.value!.place);
      if (_disposed) return;
      if (likeResult case ResultFailed()) {
        _errorsController.safeAdd('Ошибка');
      }
    }
    _likeInProgress = false;
  }
}
