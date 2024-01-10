import 'package:flutter/material.dart';
import 'package:manganime/Widgets/search_bar.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_list.dart';
import 'package:manganime/widgets/anime_header.dart';

//---External---
//https://pub.dev/packages/flutter_image_slideshow/example
//import 'package:wp_pivot_flutter/wp_pivot_flutter.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Anime>>>(
      future: apiAsyncLoadAllAnimes(),
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
        final List<Anime> listUpcoming = snapshot.data![2];

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
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
                  CarouselTopAnimes(listTop: listTop),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 150,
                            height: 25,
                            child: TabBar(
                              dividerColor: Colors.cyan,
                              tabs: [
                                Tab(text: "Latest episodes"),
                                Tab(text: "Most Popular"),
                                Tab(text: "Upcoming"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              AnimeGrid(
                                animeList: listRecent,
                              ),
                              AnimeGrid(
                                animeList: listTop,
                              ),
                              AnimeGrid(
                                animeList: listUpcoming,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
