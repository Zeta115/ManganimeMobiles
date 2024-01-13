import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manganime/Widgets/search_bar.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/manga.dart';
import 'package:manganime/widgets/manga_list.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiAsyncLoadTopMangas(),
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
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (constraints.maxWidth / (225 + 20)).round(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return MangaListItem(manga: snapshot.data![index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
