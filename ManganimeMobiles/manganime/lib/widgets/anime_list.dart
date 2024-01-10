import 'package:flutter/material.dart';

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
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed(
                  "/episode",
                  arguments: widget.anime,
                );
                debugPrint(widget.anime.title);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: NetworkImage(widget.anime.image),
                    fit: BoxFit.cover,
                  ),
                ),
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
  const AnimeGrid({super.key, required this.animeList});
  final List<Anime> animeList;

  @override
  State<AnimeGrid> createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 225,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return AnimeListItem(anime: widget.animeList[index]);
        },
        childCount: widget.animeList.length,
      ),
    );
  }
}
