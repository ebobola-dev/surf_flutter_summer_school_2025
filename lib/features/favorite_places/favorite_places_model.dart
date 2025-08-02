import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/stream_controller.dart';
import 'package:surf_flutter_summer_school_2025/common/utils/extensions/value_notifier.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/result.dart';
import 'package:surf_flutter_summer_school_2025/core/domain/entity/sorted_map.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/repositories/i_places_repository.dart';

class FavoritePlacesModel extends ElementaryModel {
  final IPlacesRepository _repository;

  FavoritePlacesModel({
    required IPlacesRepository placesRepository,
  }) : _repository = placesRepository;

  late final StreamSubscription<List<FavoritePlaceEntity>> _favoritesSubscription;
  final _favoritesMap = ValueNotifier<SortedMap<int, PlaceEntity>?>(null);
  final _isLoading = ValueNotifier<bool>(false);
  final _errorsController = StreamController<String>();

  Stream<String> get errorsStream => _errorsController.stream;
  ValueListenable<bool> get isLoading => _isLoading;
  ValueNotifier<SortedMap<int, PlaceEntity>?> get favoritesMap => _favoritesMap;

  @override
  void init() {
    _favoritesSubscription = _repository.favoritesStream.listen(_favoritesListener);
    refresh();
    super.init();
  }

  @override
  void dispose() {
    _favoritesSubscription.cancel();
    _favoritesMap.dispose();
    _isLoading.dispose();
    _errorsController.close();
    super.dispose();
  }

  SortedMap<int, PlaceEntity> _convert(List<FavoritePlaceEntity> favoritesList) {
    final placesList = favoritesList.map((favPlace) => favPlace.place).toList();
    return SortedMap.fromList(list: placesList, getId: (place) => place.id);
  }

  Future<void> refresh() async {
    if (_isLoading.value) return;
    _isLoading.emit(true);
    final favoritePlacesResult = await _repository.getFavoritePlaces();
    switch (favoritePlacesResult) {
      case ResultOk(:final data):
        {
          _favoritesMap.emit(_convert(data));
        }
      case ResultFailed():
        {
          _errorsController.safeAdd('Не удалось получить избранные');
        }
    }
    _isLoading.emit(false);
  }

  Future<void> unlike(int placeId) async {
    final unlikeResult = await _repository.unlikePlace(placeId);
    if (unlikeResult case ResultFailed()) {
      _errorsController.safeAdd('Ошибка при удалении');
    }
  }

  void _favoritesListener(List<FavoritePlaceEntity> favoritesList) {
    _favoritesMap.emit(_convert(favoritesList));
  }
}
