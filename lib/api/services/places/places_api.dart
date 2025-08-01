import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:surf_flutter_summer_school_2025/api/places/place_dto.dart';
import 'package:surf_flutter_summer_school_2025/api/places/search_result_dto.dart';

part 'places_api.g.dart';

@RestApi(baseUrl: '/places')
abstract class PlacesApi {
  factory PlacesApi(Dio dio, {String baseUrl}) = _PlacesApi;

  @GET('/')
  Future<List<PlaceDto>> fetchAll();

  @GET('/{id}')
  Future<PlaceDto> fetchOne(@Path('id') int placeId);

  @GET('/search')
  Future<SearchResultDto> search(
    @Query('q') String query,
    @Query('limit') String? limit,
    @Query('offset') String? offset,
  );
}
