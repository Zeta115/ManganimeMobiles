import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';
import 'package:manganime/screens/UserScreen.dart';

class CharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.my_library_books, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MangaScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.tv_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimeScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list_alt,
                color: Colors.orange,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
