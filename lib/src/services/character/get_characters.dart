import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../models/all_characters.dart';

class CharacterService {
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
