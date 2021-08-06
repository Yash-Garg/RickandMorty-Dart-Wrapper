enum CharacterSpecies { human, alien, empty }
enum CharacterStatus { alive, unknown, dead, empty }
enum CharacterGender { male, female, unknown, empty }

final characterSpeciesValues = {
  CharacterSpecies.alien: "Alien",
  CharacterSpecies.human: "Human",
  CharacterSpecies.empty: "",
};

final characterStatusValues = {
  CharacterStatus.alive: "Alive",
  CharacterStatus.dead: "Dead",
  CharacterStatus.empty: "",
};

final characterGenderValues = {
  CharacterGender.female: "Female",
  CharacterGender.male: "Male",
  CharacterGender.unknown: "unknown",
  CharacterGender.empty: "",
};
