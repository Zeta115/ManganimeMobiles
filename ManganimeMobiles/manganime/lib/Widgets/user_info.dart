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
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(widget.defineduser.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: screenSize.height / 3,
                  width: screenSize.width / 3,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    widget.defineduser.about,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
