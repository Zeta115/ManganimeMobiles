import 'package:flutter/material.dart';
import 'package:manganime/screens/episode_info_screen.dart';
import 'package:manganime/screens/screen_manager.dart';

void main() {
  runApp(const AnimeMangaApp());
}

class AnimeMangaApp extends StatefulWidget {
  const AnimeMangaApp({super.key});

  @override
  State<AnimeMangaApp> createState() => _AnimeMangaAppState();
}

class _AnimeMangaAppState extends State<AnimeMangaApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(), // TODO: maybe it would be good an option to switch between dark and light mode
        routes: {
          "/": (_) => const  MainScreens(),
          "/episode": (_) => const EpisodeInfoScreen(),
        },);
  }
}
