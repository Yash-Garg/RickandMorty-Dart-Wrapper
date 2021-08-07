# The Rick and Morty API Dart Wrapper

This is a Dart wrapper to use the [The Rick and Morty API](https://rickandmortyapi.com)

**To get started check the documentation on [rickandmortyapi.com](https://rickandmortyapi.com/documentation)**

## Basic Usage

```dart
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

var episodeService = EpisodeService();

// This function will print all episodes on page 1
void allEpisodes() async {
    AllEpisodes episodes = await episodeClass.getAllEpisodes();
    print(episodes);
}
```

## Complete Usage

The complete usage is in the [example directory](https://github.com/Yash-Garg/RickandMorty-Dart-Wrapper/tree/main/example)
