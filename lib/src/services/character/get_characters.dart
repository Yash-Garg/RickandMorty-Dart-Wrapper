import '../../../rick_and_morty_api.dart';
import '../entities/get_entities.dart';
import '../../enums.dart';

class CharacterService extends GetEntitiesService {
  Future<List<Character>> getAllCharacters() async {
    List<Map<String, dynamic>> objects = await super
        .getAllEntities('${Constants.baseURL}${Constants.characterEndpoint}');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getListOfCharacters(List<int> ids) async {
    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.characterEndpoint}/$ids');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }

  Future<List<Character>> getFilteredCharacters(
      CharacterFilters filters) async {
    var prefs =
        '?name=${filters.name}&status=${characterStatusValues[filters.status]}&gender=${characterGenderValues[filters.gender]}&type=${filters.type}&species=${characterSpeciesValues[filters.species]}';

    List<Map<String, dynamic>> objects = await super.getAllEntities(
        '${Constants.baseURL}${Constants.characterEndpoint}$prefs');

    return List<Character>.from(objects.map((x) => Character.fromJson(x)));
  }
}
