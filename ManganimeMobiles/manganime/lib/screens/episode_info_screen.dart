import 'package:flutter/material.dart';
import 'package:manganime/custom_icons/search_icon.dart';

import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_info.dart';
import 'package:manganime/widgets/collapsing_header.dart';
import 'package:manganime/widgets/episode_list.dart';

import 'package:manganime/widgets/video_play.dart';
import 'package:manganime/widgets/video_player.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                  width: screenSize.width,
                  height: 300 * screenSize.aspectRatio,
                  child: VideoPlay(
                      ytId:
                          anime.trailer) //PlayVideo(/*url: anime.trailer*/),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 175,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: NetworkImage(anime.image),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.45,
                  height: 250,
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
                          maxLines: (250 / 20).round(),
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox,
                  CollapsingHeader(
                    header: "Information",
                    wid: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Information(anime: anime),
                    ),
                  ),
                  const Divider(thickness: 2),
                  const CollapsingHeader(
                    header: "Episodes",
                    wid: EpisodeList(),
                    //subTrailing: const [Icons.sort_rounded, CustomIcons.search,]
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
