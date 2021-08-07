import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rm_client.dart';

import '../globals.dart';

List<int> _locIDs = [16, 10, 19];

class SpecifiedLocationListView extends StatelessWidget {
  const SpecifiedLocationListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Location>>(
      future: locationClass.getListOfLocations(_locIDs),
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
