import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepository {
  FirebaseUserRepository(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {

    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
