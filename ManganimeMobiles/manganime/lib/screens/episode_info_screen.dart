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
    final screenSize = MediaQuery.of(context).size;

    //late VideoPlayerController _controller;
    //late Future<void> _initializeVideoPlayerFuture;

    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  anime.favourite = !anime.favourite;
                  debugPrint("$anime.favourite");
                });
              },
              child: Icon(
                (anime.favourite == true) ? Icons.favorite : Icons.favorite_border_rounded,
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
                    children: [
                      Text("Synopsis: ${anime.synopsis}",
                          style: TextStyle(fontSize: 14)),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.stream_rounded),
                          Text("data"),

                          
                          Icon(Icons.all_out),
                          Text("data"),
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
