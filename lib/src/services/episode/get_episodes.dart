import 'package:dio/dio.dart';
import 'package:rick_and_morty_api/src/models/all_episodes.dart';
import 'package:rick_and_morty_api/src/models/episode.dart';
import 'package:rick_and_morty_api/src/services/episode/ep_filters.dart';

import '../../constants.dart';

class EpisodeService {
  static final Dio _dio = Dio();

  Future<AllEpisodes> getAllEpisodes() async {
    try {
      var response =
          await _dio.get('${Constants.baseURL}${Constants.episodeEndpoint}');

      return AllEpisodes.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<List<Episode>> getListOfEpisodes(List<int> ids) async {
    try {
      var response = await _dio
          .get('${Constants.baseURL}${Constants.episodeEndpoint}/$ids');
      return List<Episode>.from(
        response.data.map((i) => Episode.fromJson(i)),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<AllEpisodes> getFilteredEpisodes(EpisodeFilters filters) async {
    try {
      var prefs = '?name=${filters.name}&episode=${filters.episode}';
      var response = await _dio
          .get('${Constants.baseURL}${Constants.episodeEndpoint}$prefs');
      return AllEpisodes.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
