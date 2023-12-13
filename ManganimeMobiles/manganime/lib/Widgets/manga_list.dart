import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/models/manga.dart';

class MangaListItem extends StatefulWidget {
  const MangaListItem({
    super.key,
    required this.manga,
  });

  final Manga manga;

  @override
  State<MangaListItem> createState() => _MangaListItemState();
}

class _MangaListItemState extends State<MangaListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(
                "/episode",
                arguments: widget.manga, // Passo el número...
              );
              debugPrint(widget.manga.title);
            });
          },
          child: Container(
            height: 150,
            width: 450,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(widget.manga.image),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Text(widget.manga.title),
        Text(widget.manga.status),
      ],
    );
  }
}

class MangaGrid extends StatefulWidget {
  MangaGrid({this.count = 3, super.key});
  int count;

  @override
  State<MangaGrid> createState() => _AnimeGridState();
}

class _AnimeGridState extends State<MangaGrid> {
  @override
  Widget build(BuildContext context) {
    final List<Manga> mangaList = context.read<List<Manga>>();
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1,
      crossAxisCount: widget.count,
      children: [
        for (int i = 0; i < mangaList.length; i++)
          MangaListItem(manga: mangaList[i]),
      ],
    );
  }
}
