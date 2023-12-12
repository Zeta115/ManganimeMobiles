import 'package:flutter/material.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';
import 'package:manganime/widgets/nav_bar.dart';

class AnimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
