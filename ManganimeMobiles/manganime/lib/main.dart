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

class AnimeMangaApp extends StatefulWidget {
  AnimeMangaApp({super.key});

  @override
  State<AnimeMangaApp> createState() => _AnimeMangaAppState();
}

class _AnimeMangaAppState extends State<AnimeMangaApp> {
  int currentScreen = 0;

// Must be in the same order than the nav var items
  Set<Widget> screens_ = {    
    AnimeScreen(),
    MangaScreen(),
    CharacterScreen(),
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
        bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black87,
      currentIndex: currentScreen,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      items: [
        navBarItem("Anime", Icons.dangerous),
        navBarItem("Manga", Icons.dangerous),
        navBarItem("Characters", Icons.dangerous),
        navBarItem("User", Icons.dangerous)
      ],
      onTap: setSelectedScreen,
    ),
        body: screens_.elementAt(currentScreen),
      ),
    );
  }
}
