import 'package:flutter/material.dart';
import 'package:manganime/Widgets/character_info.dart';

import 'package:manganime/api.dart';
import 'package:manganime/models/character.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiAsyncLoadTopCharacters(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Character>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              for (int index = 0; index < 10; ++index)
                CharacterListItem(character: snapshot.data![index])
            ],
          );
        });
  }
}
