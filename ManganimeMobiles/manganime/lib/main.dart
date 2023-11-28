import 'package:flutter/material.dart';

//De momento lo he empezado asi de una pero hay que separar las screens y tal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
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
            Align(
              alignment: Alignment.topRight,
              child: const Text(
                "Espacio para descripciones o gustos de usuario",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.my_library_books),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.tv_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list_alt),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
