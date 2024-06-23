import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painel_sos_mulher/app/modules/auth/auth_states.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/firebase_user/firebase_user_repository.dart';

class AuthController extends Cubit<AuthStates> {
  AuthController(this._authRepo) : super(InitialAuthState());

  final FirebaseUserRepository _authRepo;

  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');

  final ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);

  void hide() {
    isHidden.value = !isHidden.value;
  }

  void signIn() async {
    emit(LoadingAuthState());
    try {
      await _authRepo.signIn(
        email: email.text,
        password: password.text,
      );
      emit(SuccessAuthState());
    } on AppError catch (e) {
      emit(ErrorAuthState(e));
    } catch (e) {
      log('UNHANDLED ERROR: $e');
    }
  }
}
