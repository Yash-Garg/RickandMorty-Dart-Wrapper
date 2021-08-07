import 'package:dio/dio.dart';

import '../../../rm_client.dart';
import '../../constants.dart';
import '../../enums.dart';
import '../../models/all_characters.dart';
import '../../models/character.dart';

class CharacterService {
  static final Dio _dio = Dio();

  Future<AllCharacters> getAllCharacters() async {
    try {
      var response =
          await _dio.get('${Constants.baseURL}${Constants.characterEndpoint}');

      return AllCharacters.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<List<Character>> getListOfCharacters(List<int> ids) async {
    try {
      var response = await _dio
          .get('${Constants.baseURL}${Constants.characterEndpoint}/$ids');
      return List<Character>.from(
        response.data.map((i) => Character.fromJson(i)),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<AllCharacters> getFilteredCharacters(CharacterFilters filters) async {
    try {
      var prefs =
          '?name=${filters.name}&status=${characterStatusValues[filters.status]}&gender=${characterGenderValues[filters.gender]}&type=${filters.type}&species=${characterSpeciesValues[filters.species]}';
      var response = await _dio
          .get('${Constants.baseURL}${Constants.characterEndpoint}$prefs');
      return AllCharacters.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
