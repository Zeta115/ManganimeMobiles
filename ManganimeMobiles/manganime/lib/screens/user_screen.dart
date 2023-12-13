import 'package:flutter/material.dart';

// TODO: The app maybe do all in english? The api info is in english
// [W]: no deberia haber ninguna línea azul/verde... que signifique warning de alguna cosa. Ctrl + .
// debería servir en la mayoria de casos para solucionarlo
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
