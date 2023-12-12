import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({
    this.currentScreen = 0,
    super.key,
  });

  int currentScreen;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black87,
      currentIndex: currentScreen,
      type: BottomNavigationBarType.fixed,
      items: [
        navBarItem("Anime", Icons.dangerous),
        navBarItem("Manga", Icons.dangerous),
        navBarItem("Characters", Icons.dangerous),
        navBarItem("User", Icons.dangerous)
      ],
    );
  }

  BottomNavigationBarItem navBarItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(
        icon,
        color: Colors.cyan,
      ),
      label: label,
    );
  }
}
