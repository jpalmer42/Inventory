import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contents/authentication/auth.dart';
import 'package:contents/pages/company_selection.dart';
import 'package:contents/providers/domain/user.dart';
import 'package:flutter/material.dart';

class LandingEntry extends StatelessWidget {
  const LandingEntry({Key? key}) : super(key: key);

  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      // body: StreamBuilder(
      //   stream: getUsers(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return ElevatedButton.icon(
      //         onPressed: () => {signOut(context)},
      //         icon: const Icon(Icons.login, size: 24.0),
      //         label: Text('Log Off - ${Auth().currentUser?.displayName!}'),
      //         style: ElevatedButton.styleFrom(
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      //         ),
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyWidget(snapshot.data as DaoUser);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
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

  Future<DaoUser?> getUser() async {
    final uid = Auth().currentUser?.uid;
    final usersTable = FirebaseFirestore.instance.collection('users');
    final userData = usersTable.doc(uid);
    final snapshot = await userData.get();
    if (snapshot.exists) {
      return DaoUser.fromJson(snapshot.data()!);
    }
    return null;
  }

  Stream<List<DaoUser>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => DaoUser.fromJson(doc.data())).toList());
}
