import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/rm_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var charactersClass = CharacterService();
var episodeClass = EpisodeService();

final _tabs = ['CHARACTER', 'EPISODES'];

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
            tabs: [for (final tab in _tabs) Tab(child: Text(tab))],
          ),
        ),
        body: TabBarView(
          children: [
            CharacterListView(),
            EpisodeListView(),
          ],
        ),
      ),
    );
  }
}

class EpisodeListView extends StatelessWidget {
  const EpisodeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllEpisodes>(
      future: episodeClass.getAllEpisodes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error Loading Data.'));
        } else {
          var episodes = snapshot.data!.results;
          return ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(episodes[index].name),
                subtitle: Text('Index Number - ${index + 1}'),
              );
            },
          );
        }
      },
    );
  }
}

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllCharacters>(
      future: charactersClass.getAllCharacters(),
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
