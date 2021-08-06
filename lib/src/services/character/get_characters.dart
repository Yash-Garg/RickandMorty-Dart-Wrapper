import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../models/all_characters.dart';
import '../../models/character.dart';

class CharacterService {
  static final Dio _dio = Dio();

  Future<AllCharacters> getAllCharacters() async {
    try {
      print('Fetching characters...');
      var response =
          await _dio.get('${Constants.baseURL}${Constants.characterEndpoint}');

      return AllCharacters.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<List<Character>> getMultipleCharacters(List<int> ids) async {
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
}
