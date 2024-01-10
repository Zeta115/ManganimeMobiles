import 'package:flutter/material.dart';

class CollapsingHeader extends StatefulWidget {
  const CollapsingHeader(
      {super.key, required this.header, required this.wid, this.subTrailing});

  final String header;
  final Widget wid;
  final List<IconData>? subTrailing;

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
          leading: Icon(open
              ? Icons.keyboard_arrow_down_rounded
              : Icons.keyboard_arrow_right_rounded),
          title: Text(
            widget.header,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          trailing: widget.subTrailing == null
              ? null
              : Row(
                  children: [
                    for (int i = 0; i < widget.subTrailing!.length; ++i)
                      Icon(widget.subTrailing?[i], size: i * 0.5),
                  ],
                ),
          onTap: () => setState(() {
            open = !open;
          }),
        ),
        (open) ? widget.wid : const SizedBox(),
      ],
    );
  }
}
