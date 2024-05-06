import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';

class FirebaseUserRepository {
  FirebaseUserRepository( this.firebaseAuth);

  FirebaseAuth firebaseAuth;


  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  
  Future<String> signUp({
      required String name,
      required String lastName,
      required String email,
      required String password
      }) async {
    return '';
  }

  Future<bool> setCurrentUser(UserModel user) async {
    return true;
  }

  Future<UserModel?> getCurrentUser() async {
    return null;
  }
}
