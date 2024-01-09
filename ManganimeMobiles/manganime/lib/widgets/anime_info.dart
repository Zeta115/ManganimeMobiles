import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';

class Information extends StatelessWidget {
  const Information({
    super.key, required this.anime
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> info = {
      "State:": anime.status,
      "Episodes:": anime.episodes,
      "Source:": anime.source,
      "Popularity:": "#${anime.popularity}",
      //
      "Type:": anime.type,
      "Studio:": anime.studio,
      "Release Date:": anime.date,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < info.length / 2; ++i)
              InfoVars(
                map: info,
                index: i,
              ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = (info.length / 2).round(); i < info.length; ++i)
              InfoVars(
                map: info,
                index: i,
              ),
          ],
        ),
      ],
    );
  }
}

class InfoVars extends StatelessWidget {
  const InfoVars({
    super.key,
    required this.map,
    required this.index,
  });

  final Map<String, dynamic> map;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
      child: Row(
        children: [
          const Icon(
            Icons.stream_rounded,
            size: 15,
            color: Colors.cyan,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(map.keys.elementAt(index),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          ),
          Text(map.values.elementAt(index).toString(),
              style: const TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}
