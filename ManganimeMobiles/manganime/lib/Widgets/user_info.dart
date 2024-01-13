import 'package:flutter/material.dart';

import 'package:manganime/models/user.dart';

class UserListItem extends StatefulWidget {
  const UserListItem({
    Key? key,
    required this.defineduser,
  }) : super(key: key);

  final User2 defineduser;

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(widget.defineduser.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text("/", style: TextStyle(fontSize: 30)),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(widget.defineduser.name_kanji,
                    style: const TextStyle(fontSize: 20)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26,
                image: DecorationImage(
                  image: NetworkImage(widget.defineduser.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              widget.defineduser.about,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
