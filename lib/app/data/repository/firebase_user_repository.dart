import '../../models/user_model.dart';

class FirebaseUserRepository {
  Future<String> signIn({
    required String emailOrName,
    required String password,
  }) async {
     return '';
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
