import 'package:dio/dio.dart';
import '../../models/info.dart';
import '../../../rick_and_morty_api.dart';

abstract class GetEntitiesService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);
        Info info = await Info.fromJson(response.data["info"]);
        allEntities
            .addAll(List<Map<String, dynamic>>.from(response.data["results"]));
        nextUrl = info.next;
      }

      return allEntities;
    } on DioError {
      rethrow;
    }
  }
}
