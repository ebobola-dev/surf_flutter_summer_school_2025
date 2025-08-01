import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:surf_flutter_summer_school_2025/api/places/place_dto.dart';
import 'package:surf_flutter_summer_school_2025/api/places/search_result_dto.dart';

part 'places_api.g.dart';

@RestApi()
abstract class PlacesApi {
  factory PlacesApi(Dio dio, {String baseUrl}) = _PlacesApi;

  @GET('/places')
  Future<List<PlaceDto>> fetchAll();

  @GET('/places/{id}')
  Future<PlaceDto> fetchOne(@Path('id') int placeId);

  @GET('/places/search')
  Future<SearchResultDto> search({
    @Query('q') required String query,
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 10,
  });
}
