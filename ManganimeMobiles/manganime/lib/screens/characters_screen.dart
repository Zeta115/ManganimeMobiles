import 'package:flutter/material.dart';
import 'package:manganime/Widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 110,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/animeAppLogoFull.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SearchBarWidget(),
            ],
          ),
        ),
        //UserListItem(defineduser: defineduser)
      ],
    );
  }
}
