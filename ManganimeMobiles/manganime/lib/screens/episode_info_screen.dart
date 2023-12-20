import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';

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
      "State: ": anime.status,
      "Episodes:  ": anime.episodes,
      "Source ": anime.source,
      "Popularity: #": anime.popularity,
      //
      "Type: ": anime.type,
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
                      Row(
                        children: [
                          Column(
                            children: [
                              for(int i = 0; i < info.length; ++i)
                                InfoVars(map: info, index: i,),                              
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
    return Row(
      children: [
        const Icon(Icons.stream_rounded),
        Text(map.keys.elementAt(index)),
        Text(map.values.elementAt(index).toString())
      ],
    );
  }
}
