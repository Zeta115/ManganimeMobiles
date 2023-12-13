import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';
// import 'package:video_player/video_player.dart';

class EpisodeInfoScreen extends StatefulWidget {
  const EpisodeInfoScreen({super.key});

  @override
  State<EpisodeInfoScreen> createState() => _EpisodeInfoScreenState();
}

class _EpisodeInfoScreenState extends State<EpisodeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final Anime anime = ModalRoute.of(context)!.settings.arguments as Anime;

    //late VideoPlayerController _controller;
    //late Future<void> _initializeVideoPlayerFuture;

    return Scaffold(
      appBar: AppBar(title: Text(anime.title)),
      body: Stack(
        children: [
          Container(
              // TODO: video player
              ),
          Row(
            children: [
              Container(
                // TODO: width
                child: Column(
                  children: [
                    Text("Synopsis: ${anime.synopsis}",
                        style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Column(children: []),
            ],
          ),
        ],
      ),
    );
  }
}
