import '../enums.dart';

class CharacterParameters {
  final List<int> ids;
  final String? name;
  final CharacterStatus? status;
  final String? species;
  final String? type;
  final CharacterGender? gender;

  CharacterParameters({
    required this.ids,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });
}
