import 'character.dart';
import 'info.dart';

class AllCharacters {
  AllCharacters({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Character> results;

  factory AllCharacters.fromJson(Map<String, dynamic> json) => AllCharacters(
        info: Info.fromJson(json["info"]),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
