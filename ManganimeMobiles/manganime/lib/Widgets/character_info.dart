import 'package:flutter/material.dart';
import 'package:manganime/Widgets/search_bar.dart';

import 'package:manganime/models/character.dart';

class AcharacterListItem extends StatefulWidget {
  const AcharacterListItem({
    Key? key,
    required this.acharacter,
  }) : super(key: key);

  final Acharacter acharacter;

  @override
  State<AcharacterListItem> createState() => _AcharacterListItemState();
}

class _AcharacterListItemState extends State<AcharacterListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.black54,
              height: 100,
              width: 750,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.acharacter.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Text(
              widget.acharacter.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
