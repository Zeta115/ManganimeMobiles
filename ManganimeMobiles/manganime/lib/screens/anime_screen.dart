import 'package:flutter/material.dart';
import 'package:manganime/Widgets/search_bar.dart';

import 'package:manganime/api.dart';
import 'package:manganime/custom_icons/search_icon.dart';
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
        
        late List<Anime> filteredList;
        
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
                        //const SearchBarWidget(),

                                                SizedBox(
                          width: 200,
                          height: 30,
                          child: SearchAnchor(builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              controller: controller,
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 16.0)),
                              onTap: () {
                                controller.openView();
                              },
                              onChanged: (_) {
                                controller.openView();
                              },
                              onSubmitted: (_) {
                                setState(() {
                                  final search = controller.text.toLowerCase();
                                  filteredList = listRecent
                                      .where(
                                        (anime) => anime.title
                                            .toLowerCase()
                                            .contains(search),
                                      ).toList();
                                      

                                  if (filteredList.isNotEmpty) {
                                  } else {
                                  }
                                });
                              },
                              trailing: const <Widget>[
                                Icon(
                                  CustomIcons.search,
                                  color: Colors.cyan,
                                )
                              ],
                            );
                          }, suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
                            return List<ListTile>.generate(
                              5,
                              (int index) {
                                final String item = listRecent[index].title;
                                return ListTile(
                                  title: Text(item),
                                  onTap: () {
                                    setState(() {
                                      controller.closeView(item);
                                    });
                                  },
                                );
                              },
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  CarouselTopAnimes(listTop: listTop),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Section(name: "Latest episodes", active: true),
                        Section(name: "Most popular", active: false),
                        /*GestureDetector(
                          onTap: () {
                            setState(() {
                              recent = true;
                              popular = false;
                              upcoming = false;
                            });
                          },
                          child: Column(
                            children: [
                              Section(name: "Latest episodes", active: recent),
                              AnimeGrid(animeList: listRecent),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              recent = false;
                              popular = true;
                              upcoming = false;
                            });
                          },
                          child: Column(
                            children: [
                              Section(name: "Popular", active: popular),
                              AnimeGrid(animeList: listTop),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              recent = false;
                              popular = false;
                              upcoming = true;
                            });
                          },
                          child: Column(
                            children: [
                              Section(name: "Upcoming", active: upcoming),
                              AnimeGrid(animeList: listUpcoming),
                            ],
                          ),
                        ),
                      */
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimeGrid(
              animeList: listRecent,
            )
          ],
        );
      },
    );
  }
}

class Section extends StatelessWidget {
  const Section({super.key, required this.name, required this.active});

  final String name;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Divider(
            thickness: 5,
            color: active ? Colors.cyan : Colors.grey,
          )
        ],
      ),
    );
  }
}
