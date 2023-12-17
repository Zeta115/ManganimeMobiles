import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/screens/anime_screen.dart';
import 'package:manganime/screens/manga_screen.dart';
import 'package:manganime/screens/characters_screen.dart';
import 'package:manganime/screens/user_screen.dart';

import 'package:manganime/widgets/nav_bar.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
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
    final screenSize = MediaQuery.of(context).size;

    return Provider.value(
      value: screenSize,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          currentIndex: currentScreen,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: [
            navBarItem("Anime", Icons.dangerous),
            navBarItem("Manga", Icons.shelves),
            navBarItem("Characters", Icons.list),
            navBarItem("User", Icons.person)
          ],
          onTap: setSelectedScreen,
        ),
        body: screens_.elementAt(currentScreen),
      ),
    );
  }
}
