import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text("User name, site under construction",
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
                "User picture",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              "Description of the usuer",
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
