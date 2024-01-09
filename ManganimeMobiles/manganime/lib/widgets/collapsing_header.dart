import 'package:flutter/material.dart';
import 'package:manganime/models/anime.dart';
import 'package:manganime/widgets/anime_info.dart';

class CollapsingHeader extends StatefulWidget {
  const CollapsingHeader(
      {super.key, required this.header, required this.anime});

  final String header;
  final Anime anime;

  @override
  State<CollapsingHeader> createState() => _CollapsingHeaderState();
}

class _CollapsingHeaderState extends State<CollapsingHeader> {
  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(open ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded),
          title: Text(widget.header, style: const TextStyle(fontWeight: FontWeight.w700),),
          onTap: () => setState(() {
            open = !open;
          }),
        ),

        (open) ? Information(anime: widget.anime) : const SizedBox(),
      ],
    );
  }
}
