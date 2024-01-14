import 'package:flutter/material.dart';
import 'package:manganime/api.dart';
import 'package:manganime/models/user.dart';

import 'package:manganime/widgets/user_info.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  get defineduser => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User2>>(
      future: apiAsyncLoadUser(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<User2>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading user data'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No user data available'),
          );
        }
        return Column(
          children: [UserListItem(defineduser: snapshot.data![0])],
        );
      },
    );
  }
}
