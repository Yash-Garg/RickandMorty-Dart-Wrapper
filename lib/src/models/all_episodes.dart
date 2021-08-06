import 'episode.dart';
import 'info.dart';

class AllEpisodes {
  AllEpisodes({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Episode> results;

  factory AllEpisodes.fromJson(Map<String, dynamic> json) => AllEpisodes(
        info: Info.fromJson(json["info"]),
        results:
            List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
