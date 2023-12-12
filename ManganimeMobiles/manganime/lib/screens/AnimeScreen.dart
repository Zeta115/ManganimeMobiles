import 'package:flutter/material.dart';
import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';
import 'package:manganime/widgets/nav_bar.dart';

class AnimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Screen'),
      ),
      body:  FutureBuilder(
          future: apiAsyncLoadAnimes(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Anime>> snapshot,
          ) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final animeList = snapshot.data!;
            return ListView.builder(
                itemCount: animeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return /*AnimeListItem(animem: animeList[index])*/;
                });
          },
        ),
    );
  }
}
