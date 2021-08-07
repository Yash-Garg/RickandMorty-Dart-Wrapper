import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rm_client.dart';

import '../globals.dart';

var _filters = EpisodeFilters(
  name: 'Morty',
  episode: 'S04',
);

class FilteredEpisodeListView extends StatelessWidget {
  const FilteredEpisodeListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllEpisodes>(
      future: episodeClass.getFilteredEpisodes(_filters),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!.results;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(characters[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
              );
            },
          );
        }
      },
    );
  }
}
