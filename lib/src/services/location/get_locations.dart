import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/src/services/location/lc_filters.dart';

import '../../../rm_client.dart';
import '../../constants.dart';
import '../../models/all_locations.dart';
import '../../models/location.dart';

class LocationService {
  static final Dio _dio = Dio();

  Future<AllLocations> getAllLocations() async {
    try {
      var response =
          await _dio.get('${Constants.baseURL}${Constants.locationEndpoint}');

      return AllLocations.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<List<Location>> getListOfLocations(List<int> ids) async {
    try {
      var response = await _dio
          .get('${Constants.baseURL}${Constants.locationEndpoint}/$ids');
      return List<Location>.from(
        response.data.map((i) => Location.fromJson(i)),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<AllLocations> getFilteredLocations(LocationFilters filters) async {
    try {
      var prefs =
          '?name=${filters.name}&type=${filters.type}&dimension=${filters.dimension}';
      var response = await _dio
          .get('${Constants.baseURL}${Constants.locationEndpoint}$prefs');
      return AllLocations.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
