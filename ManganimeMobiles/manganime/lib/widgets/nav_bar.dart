import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentScreen = context.read<int>();
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
      onTap: setSelectedScreen(),
    );
  }
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
