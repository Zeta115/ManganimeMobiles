import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/models/anime.dart';

class AnimeListItem extends StatelessWidget {
  const AnimeListItem({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anime.title),
      subtitle: Text(anime.status),
      leading: Image(image: NetworkImage(anime.image)),
    );
  }
}

class AnimeGrid extends StatefulWidget {
  AnimeGrid({this.count = 3, super.key});

  int count;

  @override
  State<AnimeGrid> createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  @override
  Widget build(BuildContext context) {
  final animeList = context.read<List<Anime>>();
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
      ],
    );
  }
}
