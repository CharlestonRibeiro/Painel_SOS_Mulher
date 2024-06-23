import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:painel_sos_mulher/app/data/repository/firebase_user/firebase_user_exception.dart';

class FirebaseUserRepository {
  FirebaseUserRepository(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;


Future<void> signIn({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    /// Tratando a exceção com a classe FirebaseUserException
    final error = FirebaseUserException(e);
    log(error.message); 
    throw error; /// Lança a exceção para o invocador do método signIn lidar com ela, se necessário
  } catch (e) {
    /// Trata outras exceções não relacionadas à FirebaseAuthException
    log('Erro desconhecido: $e');
    throw Exception('Erro desconhecido ao tentar entrar.');
  }
}

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      /// Tratando a exceção com a classe FirebaseUserException
      final error = FirebaseUserException(e);
      log(error.message); 
      throw error; /// Lança a exceção para o invocador do método signUp lidar com ela, se necessário
    } catch (e) {
      /// Trata outras exceções não relacionadas à FirebaseAuthException
      log('Erro desconhecido: $e');
      throw Exception('Erro desconhecido ao tentar registrar usuário.');
    }
  }
}
