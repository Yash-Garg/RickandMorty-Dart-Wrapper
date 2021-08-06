import 'package:rick_and_morty_api/src/models/character.dart';

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

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
