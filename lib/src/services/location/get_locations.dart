import '../../../rick_and_morty_api.dart';
import '../entities/get_entities.dart';

class LocationService extends GetEntitiesService {
  Future<List<Location>> getAllLocations() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.locationEndpoint}');

    return List<Location>.from(objects.map((x) => Location.fromJson(x)));
  }

  Future<List<Location>> getListOfLocations(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.locationEndpoint}/$ids');

    return List<Location>.from(objects.map((x) => Location.fromJson(x)));
  }

  Future<List<Location>> getFilteredLocations(LocationFilters filters) async {
    var prefs =
        '?name=${filters.name}&type=${filters.type}&dimension=${filters.dimension}';

    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.locationEndpoint}$prefs');

    return List<Location>.from(objects.map((x) => Location.fromJson(x)));
  }
}
