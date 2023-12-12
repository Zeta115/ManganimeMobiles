import 'package:flutter/material.dart';
import 'package:manganime/screens/AnimeScreen.dart';
import 'package:manganime/screens/CharactersScreen.dart';
import 'package:manganime/screens/MangaScreen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text("Nombre del usuario",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black26),
                child: const Text(
                  "Foto para usuario",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                "Espacio para descripciones o gustos de usuario",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
