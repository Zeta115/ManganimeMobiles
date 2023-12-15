import 'package:flutter/material.dart';

import 'package:manganime/models/anime.dart';

class AnimeHeader extends StatefulWidget {
  const AnimeHeader({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  State<AnimeHeader> createState() => _AnimeHeaderState();
}

class _AnimeHeaderState extends State<AnimeHeader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
