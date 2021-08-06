import '../../enums.dart';

class CharacterFilters {
  final String? name;
  final CharacterStatus? status;
  final String? species;
  final String? type;
  final CharacterGender? gender;

  CharacterFilters({
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });
}
