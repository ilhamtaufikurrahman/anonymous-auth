import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInAnonymous() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User user = credential.user!;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();

  static Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = credential.user!;

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = credential.user!;

      return user;
    } catch (e) {
      print(e);
    }
  }
}
