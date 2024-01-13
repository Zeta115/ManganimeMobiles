import 'package:flutter/material.dart';

import 'package:manganime/models/character.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem(
      {Key? key, required this.character, required this.index})
      : super(key: key);

  final Character character;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(character.image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("#$index"),
        ),
        Text(
          character.name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
