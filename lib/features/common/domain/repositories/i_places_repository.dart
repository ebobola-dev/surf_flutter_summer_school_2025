import 'package:surf_flutter_summer_school_2025/core/architecture/domain/entity/request_operation.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/favorite_place.dart';
import 'package:surf_flutter_summer_school_2025/features/common/domain/entities/place.dart';

abstract interface class IPlacesRepository {
  RequestOperation<List<PlaceEntity>> fetchAllPlaces();
  RequestOperation<PlaceEntity> fetchOnePlace(int id);
  RequestOperation<List<PlaceEntity>> search({
    required String query,
    int offset = 0,
    int limit = 10,
  });

  RequestOperation<List<FavoritePlaceEntity>> getFavoritePlaces();
  RequestOperation<FavoritePlaceEntity> likePlace(PlaceEntity place);
  RequestOperation<void> unlikePlace(int placeId);
  RequestOperation<bool> isFavorite(int placeId);

  Stream<List<FavoritePlaceEntity>> get favoritesStream;
}
