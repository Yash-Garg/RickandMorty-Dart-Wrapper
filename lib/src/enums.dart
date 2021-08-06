enum CharacterSpecies { HUMAN, ALIEN }
enum CharacterStatus { ALIVE, UNKNOWN, DEAD }
enum CharacterGender { MALE, FEMALE, UNKNOWN }

final characterSpeciesValues = {
  "Alien": CharacterSpecies.ALIEN,
  "Human": CharacterSpecies.HUMAN,
};

final characterStatusValues = {
  "Alive": CharacterStatus.ALIVE,
  "Dead": CharacterStatus.DEAD,
  "unknown": CharacterStatus.UNKNOWN,
};

final characterGenderValues = {
  "Female": CharacterGender.FEMALE,
  "Male": CharacterGender.MALE,
  "unknown": CharacterGender.UNKNOWN,
};
