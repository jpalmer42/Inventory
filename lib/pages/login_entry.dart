import 'package:contents/pages/landing_entry.dart';
import 'package:contents/services/authentication.dart';
import 'package:flutter/material.dart';

class LoginEntry extends StatelessWidget {
  const LoginEntry({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: ElevatedButton.icon(
        onPressed: () => {signInWithGoogle(context)},
        icon: const Icon(Icons.login, size: 24.0),
        label: Text('Login with Google'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await Authentication().signInWithGoogle();
      Navigator.pushReplacementNamed(context, LandingEntry.routeName);
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
