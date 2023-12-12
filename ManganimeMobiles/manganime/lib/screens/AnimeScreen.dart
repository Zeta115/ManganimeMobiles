import 'package:flutter/material.dart';
import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiAsyncLoadAnimes(), // Get API information and create an Anime structure
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
    );
  }
}
