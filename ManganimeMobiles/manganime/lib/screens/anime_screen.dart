import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_list.dart';

//https://pub.dev/packages/flutter_image_slideshow/example

class AnimeScreen extends StatelessWidget {
  AnimeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          apiAsyncLoadListAnimes(), // Get API information and create an Anime structure
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Anime>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Provider.value(
          value: snapshot.data!,
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
                  Container(
                    height: 200,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              const Divider(),
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
