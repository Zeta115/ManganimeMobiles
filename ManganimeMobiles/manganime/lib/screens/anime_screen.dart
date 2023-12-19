import 'package:flutter/material.dart';
import 'package:manganime/Widgets/search_bar.dart';
import 'package:provider/provider.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_list.dart';
import 'package:manganime/widgets/anime_header.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Anime>>>(
      future: Future.wait([
        apiAsyncLoadListAnimes(),
        apiAsyncLoadTopAnimes(),
      ]),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<List<Anime>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final List<Anime> listRecent = snapshot.data![0];
        final List<Anime> listTop = snapshot.data![1];
        
        return Provider.value(
          value: listRecent,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 110,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/animeAppLogoFull.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SearchBarWidget(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CarouselTopAnimes(listTop: listTop),
              ),
              const SliverToBoxAdapter(child: Divider()),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Latest episodes",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Most popular",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "By genre",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const AnimeGrid(),
            ],
          ),
        );
      },
    );
  }
}