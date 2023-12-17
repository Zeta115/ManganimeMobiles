import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/models/anime.dart';

class AnimeListItem extends StatefulWidget {
  const AnimeListItem({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  State<AnimeListItem> createState() => _AnimeListItemState();
}

class _AnimeListItemState extends State<AnimeListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(
                "/episode",
                arguments: widget.anime, // Passo el número...
              );
              debugPrint(widget.anime.title);
            });
          },
          child: Container(
            height: 150,
            width: 450,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(widget.anime.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            widget.anime.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(widget.anime.status),
        ),
      ],
    );
  }
}

class AnimeGrid extends StatefulWidget {
  const AnimeGrid({this.count = 3, super.key});
  final int count;

  @override
  State<AnimeGrid> createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  @override
  Widget build(BuildContext context) {
    final List<Anime> animeList = context.read<List<Anime>>();
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: widget.count * 3,
      childAspectRatio: 1,
      crossAxisCount: widget.count,
      children: [
        for (int i = 0; i < animeList.length; i++)
          AnimeListItem(anime: animeList[i]),
      ],
    );
  }
}
