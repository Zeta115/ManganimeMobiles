import 'package:flutter/material.dart';

import 'package:manganime/models/character.dart';

class CharacterListItem extends StatefulWidget {
  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  State<CharacterListItem> createState() => _CharacterListItemState();
}

class _CharacterListItemState extends State<CharacterListItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.character.image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                widget.character.name,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
