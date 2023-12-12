import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/EpisodeInfoScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';
import 'package:manganime/widgets/nav_bar.dart';

void main() {
  runApp(AnimeMangaApp());
}

class AnimeMangaApp extends StatelessWidget {
  AnimeMangaApp({super.key});
  int currentScreen = 0;
  Set<Widget> screens_ = {
    CharacterScreen(),
    AnimeScreen(),
    EpisodeInfoScreen(),
    MangaScreen(),
    UserScreen()
  };

  List<Map<String, Object>> screens = [
    {"Character": CharacterScreen()},
    {"Anime": AnimeScreen()},
    {"EpisodeInfo": const EpisodeInfoScreen()},
    {"Manga": CharacterScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: NavBar(
            currentScreen: currentScreen,
          ),
          body: screens_.elementAt(currentScreen)),
    );
  }
}
