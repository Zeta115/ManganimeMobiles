import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_list.dart';

//https://pub.dev/packages/smooth_page_indicator

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return AnimeGrid();
            },
          ),
        );
      },
    );
  }
}
