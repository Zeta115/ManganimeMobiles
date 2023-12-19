import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';

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


  final Map<String, dynamic> info = {"State: ": anime.status, };
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Column(
                    children: [
                      Text("Synopsis: ${anime.synopsis}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Column(
                            children: [
                              InfoVars(),
                              Icon(Icons.stream_rounded),
                              Text(" Author"),
                              Icon(Icons.stream_rounded),
                              Text(" Episodes"),
                              Icon(Icons.stream_rounded),
                              Text(" Release Data"),
                              Icon(Icons.stream_rounded),
                              Text(" Popularity"),
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.stream_rounded),
        Text(" State"),
      ],
    );
  }
}
