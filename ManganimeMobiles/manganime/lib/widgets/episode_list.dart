import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({super.key});

  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;

    return SingleChildScrollView(
      child: Column(children: [
        for (int i = anime.episodes; i > 0; ++i)
          Episode(
            i: i,
          ),
      ]),
    );
  }
}

class Episode extends StatefulWidget {
  const Episode({super.key, required this.i});
  final int i;

  @override
  State<Episode> createState() => _EpisodeState();
}

class _EpisodeState extends State<Episode> {
  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;

    return ListTile(
      trailing: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: NetworkImage(anime.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(anime.title),
        subtitle: Text("Episode ${widget.i}"),
    );
  }
}
