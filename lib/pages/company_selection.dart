import 'package:contents/authentication/auth.dart';
import 'package:contents/providers/domain/user.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget(this.user, {Key? key}) : super(key: key);
  final DaoUser? user;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton.icon(
          onPressed: () => {signOut(context)},
          icon: const Icon(Icons.login, size: 24.0),
          label: Text('Log Off - ${Auth().currentUser?.displayName!}'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
        ),
      ],
    );
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await Auth().signOut();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 5000),
          content: Text(error.toString()),
        ),
      );
    }
  }
}