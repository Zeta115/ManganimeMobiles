import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/manga.dart';
import 'package:manganime/widgets/manga_list.dart';

//https://pub.dev/packages/smooth_page_indicator

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          apiAsyncLoadListMangas(), // Get API information and create a Manga structure
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Manga>> snapshot,
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
              return MangaGrid(
                  count: (constraints.maxWidth / (225 + 20)).round());
            },
          ),
        );
      },
    );
  }
}
