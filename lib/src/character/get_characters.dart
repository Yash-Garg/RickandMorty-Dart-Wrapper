import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/src/constants.dart';
import 'package:rick_and_morty_api/src/models/all_characters.dart';

class CharactersClass {
  static final Dio _dio = Dio();

  Future<AllCharacters> getAllCharacters() async {
    try {
      print('Fetching characters...');
      var response =
          await _dio.get(Constants.baseURL + Constants.characterEndpoint);

      return AllCharacters.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
