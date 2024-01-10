import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.anime});

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
    
    return Column(
      children: [
        Row(
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
        ),
        Row(
          children: [
            for (int i = 0; i < anime.genres.length; ++i)
              Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.cyan)),
                child: Text(anime.genres[i]),
              ),
          ],
        ),
        Row(
          children: [
            const Text("Rate:",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  StarIconRating(anime: anime, i: 0),
                  StarIconRating(anime: anime, i: 1),
                  StarIconRating(anime: anime, i: 2),
                  StarIconRating(anime: anime, i: 3),
                  StarIconRating(anime: anime, i: 4),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text((anime.score * 5 / 10).toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                Text("${anime.scoredBy}",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300)),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class StarIconRating extends StatelessWidget {
  const StarIconRating({
    super.key,
    required this.anime, required this.i,
  });

  final Anime anime;
  final int i;

  @override
  Widget build(BuildContext context) {
    final Map<double, IconData> rating = {
      0: Icons.star_border_rounded,
      0.5: Icons.star_half_rounded,
      1: Icons.star_rate_rounded,
    };
    return Icon(
        (anime.score * 5 / 10 < (i + 0.3))
            ? rating[0]
            : (anime.score * 5 / 10 >= (i + 0.3) &&
                    anime.score * 5 / 10 < (i + 0.7))
                ? rating[0.5]
                : rating[1],
        size: 30, color: Colors.cyan);
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
