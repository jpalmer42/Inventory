import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return userCredential.user;
      }
      throw FirebaseAuthException(message: 'Signin Aborted by User', code: 'ERROR_ABORTED_BY_USER');
    } else {
      throw FirebaseAuthException(message: 'Signin Aborted by User', code: 'ERROR_ABORTED_BY_USER');
    }
  }
}
