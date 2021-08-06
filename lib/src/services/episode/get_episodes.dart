import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/src/models/all_episodes.dart';

import '../../constants.dart';

class EpisodeService {
  static final Dio _dio = Dio();

  Future<AllEpisodes> getAllEpisodes() async {
    try {
      print('Fetching episodes...');
      var response =
          await _dio.get('${Constants.baseURL}${Constants.episodeEndpoint}');

      return AllEpisodes.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
