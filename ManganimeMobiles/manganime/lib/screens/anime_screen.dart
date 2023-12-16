import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_list.dart';
import 'package:manganime/Widgets/anime_header.dart';

//https://pub.dev/packages/flutter_image_slideshow/example

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Anime>>>(
      future: Future.wait([
        apiAsyncLoadListAnimes(),
        //apiAsyncLoadTopAnimes(),
      ]), // Get API information and create an Anime structure
      builder: (
        BuildContext context,
        AsyncSnapshot<List<List<Anime>>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Provider.value(
          value: snapshot.data![0],
          child: Column(
            children: [
              ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  AnimeHeader(
                    anime: snapshot.data![0][0],
                  ),
                  AnimeHeader(
                    anime: snapshot.data![0][1],
                  ),
                  AnimeHeader(
                    anime: snapshot.data![0][2],
                  ),
                  AnimeHeader(
                    anime: snapshot.data![0][3],
                  ),
                  AnimeHeader(
                    anime: snapshot.data![0][4],
                  ),
                  AnimeHeader(
                    anime: snapshot.data![0][5],
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Latest episodes",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Most popular",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "By genre",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return AnimeGrid(
                        count: (constraints.maxWidth / (225 + 20)).round());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
