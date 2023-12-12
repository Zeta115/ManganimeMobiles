import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/EpisodeInfoScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';
import 'package:manganime/widgets/nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AnimeMangaApp());
}

class AnimeMangaApp extends StatefulWidget {
  AnimeMangaApp({super.key});

  @override
  State<AnimeMangaApp> createState() => _AnimeMangaAppState();
}

class _AnimeMangaAppState extends State<AnimeMangaApp> {
  int currentScreen = 0;

  Set<Widget> screens_ = {
    CharacterScreen(),
    AnimeScreen(),
    EpisodeInfoScreen(),
    MangaScreen(),
    UserScreen()
  };

  void setSelectedScreen(i) {
    setState(() {
      currentScreen = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavBar(),
        body: screens_.elementAt(currentScreen),
      ),
    );
  }
}
