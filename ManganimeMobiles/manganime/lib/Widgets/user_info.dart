import 'package:flutter/material.dart';

import 'package:manganime/models/User.dart';

class UserListItem extends StatefulWidget {
  const UserListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(widget.user.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(widget.user.name_kanji,
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
                  image: NetworkImage(widget.user.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              widget.user.about,
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
