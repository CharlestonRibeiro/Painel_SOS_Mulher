import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painel_sos_mulher/app/modules/auth/auth_states.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/firebase_user_repository.dart';
import '../../models/user_model.dart';

class AuthController extends Cubit<AuthState> {
  AuthController(this._authRepo) : super(InitialAuthState());

  final FirebaseUserRepository _authRepo;

  final name = TextEditingController(text: '');
  final lastName = TextEditingController(text: '');
  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');

  void signUp() async {
    emit(LoadingAuthState());
    try {
      await _authRepo.signUp(
        name: name.text,
        lastName: lastName.text,
        email: email.text,
        password: password.text,
      );
      await _authRepo.setCurrentUser(
        UserModel(name: name.text, email: email.text, password: password.text),
      );
      emit(SuccessAuthState());
    } on AppError catch (e) {
      emit(ErrorAuthState(e));
    } catch (e) {
      log('UNHANDLED ERROR: $e');
    }
  }

  void signIn() async {
    emit(LoadingAuthState());
    try {
      await _authRepo.signIn(
        email: email.text,
        password: password.text,
      );
      await _authRepo.setCurrentUser(
        UserModel(name: name.text, email: email.text, password: password.text),
      );
      emit(SuccessAuthState());
    } on AppError catch (e) {
      emit(ErrorAuthState(e));
    } catch (e) {
      log('UNHANDLED ERROR: $e');
    }
  }
}