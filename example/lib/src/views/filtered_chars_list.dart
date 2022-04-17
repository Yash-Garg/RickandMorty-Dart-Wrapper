import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rick_and_morty_api.dart';

import '../globals.dart';

var _filters = CharacterFilters(
  name: 'Rick',
  gender: CharacterGender.male,
  status: CharacterStatus.alive,
);

class FilteredCharacterListView extends StatelessWidget {
  const FilteredCharacterListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Character>>(
      future: charactersClass.getFilteredCharacters(_filters),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var characters = snapshot.data!;
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
