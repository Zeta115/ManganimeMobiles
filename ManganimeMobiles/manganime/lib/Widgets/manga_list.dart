import 'package:flutter/material.dart';

import 'package:manganime/models/manga.dart';

class MangaListItem extends StatefulWidget {
  const MangaListItem({
    Key? key,
    required this.manga,
  }) : super(key: key);

  final Manga manga;

  @override
  State<MangaListItem> createState() => _MangaListItemState();
}

class _MangaListItemState extends State<MangaListItem> {
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline,
            color: iconColor,
            size: 36.0,
          ),
          onPressed: () {
            setState(() {
              iconColor = iconColor == Colors.grey ? Colors.red : Colors.grey;
              widget.manga.favourite = true;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          width: 650,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
              image: NetworkImage(widget.manga.image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(
          child: ExpansionTile(
            title: Text(widget.manga.title),
            children: [
              ListTile(
                title: Text(widget.manga.status),
              ),
              ListTile(
                title: Text(
                  'Número de capítulos: ${widget.manga.chapters.toString()}',
                ),
              ),
              ListTile(
                title: Text(widget.manga.synopsis),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
