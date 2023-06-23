import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth;

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  /* Initialize the firebase auth */
  AuthRepository() : firebaseAuth = FirebaseAuth.instance;

  // sign up method
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message == null ? "Unknown error in signup" : e.message!;
    }
  }

// sign in method

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

// sign out method

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
