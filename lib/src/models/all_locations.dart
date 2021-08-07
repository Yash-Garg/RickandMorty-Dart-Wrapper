import 'package:rick_and_morty_api/src/models/location.dart';

import 'info.dart';

class AllLocations {
  AllLocations({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Location> results;

  factory AllLocations.fromJson(Map<String, dynamic> json) => AllLocations(
        info: Info.fromJson(json["info"]),
        results: List<Location>.from(
            json["results"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
