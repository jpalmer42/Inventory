import 'package:contents/providers/domain/user.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget(this.user, {Key? key}) : super(key: key);
  final DaoUser? user;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(user!.id),
        ...user!.companies.map((e) => Text(e)).toList(),
      ],
    );
  }
}
