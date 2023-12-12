import 'package:flutter/material.dart';

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
