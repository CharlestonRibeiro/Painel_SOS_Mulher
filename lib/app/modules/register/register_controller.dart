
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painel_sos_mulher/app/modules/register/register_states.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/firebase_user_repository.dart';


class RegisterController extends Cubit<RegisterStates> {
  RegisterController(this._authRepo) : super(InitialRegisterState());

  final FirebaseUserRepository _authRepo;

  final GlobalKey<FormState> formKey = GlobalKey();

  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');
  final confirmPassword = TextEditingController(text: '');


  final ValueNotifier<bool> isHidden = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isHiddenConfirm = ValueNotifier<bool>(true);

  void hide() {
    isHidden.value = !isHidden.value;
  }

  void hideConfirm() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }

  void signUp() async {
    emit(LoadingRegisterState());
    try {
      await _authRepo.signUp(
        email: email.text,
        password: password.text,
      );
      emit(SuccessRegisterState());
    } on AppError catch (e) {
      emit(ErrorRegisterState(e));
    } catch (e) {
      log('UNHANDLED ERROR: $e');
    }
  }

}
