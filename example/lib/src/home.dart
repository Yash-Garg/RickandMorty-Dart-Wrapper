import 'package:flutter/material.dart';

import 'views/all_chars_list.dart';
import 'views/all_eps_list.dart';
import 'views/all_locations_list.dart';
import 'views/filtered_chars_list.dart';
import 'views/filtered_eps_list.dart';
import 'views/filtered_locations_list.dart';
import 'views/specified_chars_list.dart';
import 'views/specified_eps_list.dart';
import 'views/specified_locations_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final _tabs = [
  'CHARACTER',
  'EPISODES',
  'LOCATIONS',
  'FILTERED CHARACTERS',
  'FILTERED EPISODES',
  'FILTERED LOCATIONS',
  'SPECIFIED CHARACTERS',
  'SPECIFIED EPISODES',
  'SPECIFIED LOCATIONS',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('R&M DART API'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.open_in_new)),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [for (final tab in _tabs) Tab(child: Text(tab))],
          ),
        ),
        body: TabBarView(
          children: [
            CharacterListView(),
            EpisodeListView(),
            LocationListView(),
            FilteredCharacterListView(),
            FilteredEpisodeListView(),
            FilteredLocationListView(),
            SpecifiedCharacterListView(),
            SpecifiedEpisodeListView(),
            SpecifiedLocationListView(),
          ],
        ),
      ),
    );
  }
}
