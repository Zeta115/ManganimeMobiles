import 'package:flutter/material.dart';
import 'package:manganime/screens/anime_screen.dart';
import 'package:manganime/screens/manga_screen.dart';
import 'package:manganime/screens/characters_screen.dart';
import 'package:manganime/screens/user_screen.dart';

import 'package:manganime/widgets/nav_bar.dart';

void main() {
  runApp(const AnimeMangaApp());
}

class AnimeMangaApp extends StatefulWidget {
  const AnimeMangaApp({super.key});

  @override
  State<AnimeMangaApp> createState() => _AnimeMangaAppState();
}

class _AnimeMangaAppState extends State<AnimeMangaApp> {
  int currentScreen = 0;

// Must be in the same order than the nav var items
  Set<Widget> screens_ = {
    const AnimeScreen(),
    const MangaScreen(),
    const CharacterScreen(),
    const UserScreen()
  };

  void setSelectedScreen(i) {
    setState(() {
      currentScreen = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),  // TODO: maybe it would be good an option to switch between dark and light mode
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
