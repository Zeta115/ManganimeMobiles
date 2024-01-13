import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manganime/Widgets/search_bar.dart';
import 'package:manganime/api.dart';
import 'package:manganime/models/character.dart';
import 'package:manganime/widgets/character_info.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(); /* FutureBuilder(
        future: apiAsyncLoadListTopCharacters(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Acharacter>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Provider.value(
              value: snapshot.data!,
              child: AcharacterListItem(acharacter: snapshot.data![]));
        });*/
  }
}
