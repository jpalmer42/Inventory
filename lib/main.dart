import 'dart:developer';

import 'package:contents/pages/landing_entry.dart';
import 'package:contents/pages/login_entry.dart';
import 'package:contents/providers/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await Preferences.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      StreamProvider.value(value: FirebaseAuth.instance.authStateChanges(), initialData: null),
    ], child: const AuthPage());
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final User? user = context<User>.read();
    final User? user = Provider.of<User?>(context);
    log('user ${user?.uid}');
    // FlutterNativeSplash.remove();

    return MaterialApp(
      initialRoute: (user == null) ? LoginEntry.routeName : LandingEntry.routeName,
      routes: {
        LoginEntry.routeName: (context) => const LoginEntry(),
        LandingEntry.routeName: (context) => const LandingEntry(),
      },
    );
  }
}
