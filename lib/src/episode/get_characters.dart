import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/src/constants.dart';
import 'package:rick_and_morty_api/src/models/all_characters.dart';

class CharactersClass {
  static Dio _dio = Dio();

  Future<AllCharacters> getAllCharacters() async {
    print('Initializing');
    var response =
        await _dio.get(Constants.baseURL + Constants.characterEndpoint);

    final AllCharacters allCharacters = AllCharacters.fromJson(response.data);
    return allCharacters;
  }
}
