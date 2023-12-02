import 'package:flutter/material.dart';
import 'screens/UserScreen.dart';
//De momento lo he empezado asi de una pero hay que separar las screens y tal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(),
    );
  }
}
