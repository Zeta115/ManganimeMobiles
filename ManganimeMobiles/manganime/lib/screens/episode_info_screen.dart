import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';
import 'package:video_player/video_player.dart';

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

    late VideoPlayerController _controller;
    late Future<void> _initializeVideoPlayerFuture;

    @override
    void initState() {
      super.initState();
      _controller = VideoPlayerController.networkUrl(Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    }

    @override
    void dispose() {
      super.dispose();
      _controller.dispose();
    }

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
                Container(
                  width: screenSize.width,
                  height: 200,
                  color: Colors.amber,
                  // TODO: video player
                ),
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
