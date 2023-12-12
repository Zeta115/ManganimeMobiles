import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/UserScreen.dart';

class MangaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
