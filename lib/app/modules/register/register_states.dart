import '../../core/errors/app_error_interface.dart';

sealed class RegisterStates {}

class InitialRegisterState implements RegisterStates {}

class LoadingRegisterState implements RegisterStates {}

class SuccessRegisterState implements RegisterStates {}

class ErrorRegisterState implements RegisterStates {
  ErrorRegisterState(this.error);

  final AppError error;
}
