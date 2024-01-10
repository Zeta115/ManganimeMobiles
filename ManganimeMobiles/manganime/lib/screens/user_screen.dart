import 'package:flutter/material.dart';
import 'package:manganime/api.dart';
import 'package:manganime/models/user.dart';
import 'package:manganime/widgets/user_info.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: apiAsyncLoadUser(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<User>> snapshot,
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

        // Use the first user from the list (assuming you want only one)
        final User defineduser = snapshot.data!.first;
        return Container(
          color: Colors.amber,
        );

        //return UserListItem(user: defineduser);
      },
    );
  }
}
