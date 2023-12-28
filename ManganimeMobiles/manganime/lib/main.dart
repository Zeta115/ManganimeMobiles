import 'package:flutter/material.dart';
import 'package:manganime/screens/screen_manager.dart';
import 'package:manganime/models/user.dart';
import 'api.dart';

void main() {
  runApp(const AnimeMangaApp());
}

class AnimeMangaApp extends StatelessWidget {
  const AnimeMangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FutureBuilder<User>(
        future: apiAsyncLoadUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras esperamos la carga del usuario, podríamos mostrar un indicador de carga.
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Manejar el error si algo sale mal.
            return const Text('Error al cargar el usuario');
          } else {
            // Si la carga es exitosa, pasamos al MainScreens.
            return MainScreens(user: snapshot.data!);
          }
        },
      ),
    );
  }
}
