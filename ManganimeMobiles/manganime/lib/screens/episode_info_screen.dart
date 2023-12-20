import 'package:flutter/material.dart';

import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/video_play.dart';

//https://steemit.com/utopian-io/@tensor/playing-local-network-and-youtube-videos-with-the-video-player-plugin-in-dart-s-flutter-framework

//https://pub.dev/packages/video_player
//https://copyprogramming.com/howto/how-to-check-if-flutter-text-widget-was-overflowed?utm_content=cmp-true
//https://medium.com/flutterworld/flutter-tabbar-and-tricks-4f36e06025a4

class EpisodeInfoScreen extends StatefulWidget {
  const EpisodeInfoScreen({super.key});

  @override
  State<EpisodeInfoScreen> createState() => _EpisodeInfoScreenState();
}

class _EpisodeInfoScreenState extends State<EpisodeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;
    final screenSize = MediaQuery.of(context).size;

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

    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  anime.favourite = !anime.favourite;
                  debugPrint("$anime.favourite");
                });
              },
              child: Icon(
                (anime.favourite == true)
                    ? Icons.favorite
                    : Icons.favorite_border_rounded,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                    width: 720,
                    height: 360,
                    child: PlayVideo(/*url: anime.trailer*/),
                    ),
                //PlayVideo(url: anime.trailer),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("Synopsis: ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ),
                      Text(anime.synopsis,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
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
                              for (int i = (info.length / 2).round();
                                  i < info.length;
                                  ++i)
                                InfoVars(
                                  map: info,
                                  index: i,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
