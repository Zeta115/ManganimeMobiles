import 'package:flutter/material.dart';

import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/collapsing_header.dart';
import 'package:manganime/widgets/video_play.dart';
import 'package:manganime/widgets/video_player.dart';

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

    const sizedBox = SizedBox(
      height: 10,
    );

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
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  children: [
                    SizedBox(
                        width: screenSize.width,
                        height: 300 * screenSize.aspectRatio,
                        child: VideoPlay(
                            ytId: anime
                                .trailer) //PlayVideo(/*url: anime.trailer*/),
                        ),
                    SizedBox(
                      width: screenSize.width,
                      height: 120 * screenSize.aspectRatio,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 200,
                      height: 100 * screenSize.aspectRatio,
                      color: Colors.amber,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: NetworkImage(anime.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.45,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox,
                  CollapsingHeader(
                    header: "Information",
                    anime: anime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}