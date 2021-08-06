enum CharacterSpecies { human, alien }
enum CharacterStatus { alive, unknown, dead }
enum CharacterGender { male, female, unknown }

final characterSpeciesValues = {
  "Alien": CharacterSpecies.alien,
  "Human": CharacterSpecies.human,
};

final characterStatusValues = {
  "Alive": CharacterStatus.alive,
  "Dead": CharacterStatus.dead,
  "unknown": CharacterStatus.unknown,
};

final characterGenderValues = {
  "Female": CharacterGender.female,
  "Male": CharacterGender.male,
  "unknown": CharacterGender.unknown,
};
