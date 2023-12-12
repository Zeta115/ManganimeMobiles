import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';

import 'package:manganime/widgets/nav_bar.dart';

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters Screen'),
      ),
      body: const SingleChildScrollView(
        child: Column(),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}