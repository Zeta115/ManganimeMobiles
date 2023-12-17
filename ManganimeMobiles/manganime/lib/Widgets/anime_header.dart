import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final screenSize = context.read<Size>();
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.of(context).pushNamed(
            "/episode",
            arguments: widget.anime,
          );
          debugPrint(widget.anime.title);
        });
      },
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            Center(
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
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 75,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(255, 28, 29, 33),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Text(
                  widget.anime.title,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
