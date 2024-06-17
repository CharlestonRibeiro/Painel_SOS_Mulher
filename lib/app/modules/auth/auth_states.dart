import '../../core/errors/app_error_interface.dart';

sealed class AuthStates {}

class InitialAuthState implements AuthStates {}

class LoadingAuthState implements AuthStates {}

class SuccessAuthState implements AuthStates {}

class ErrorAuthState implements AuthStates {
  ErrorAuthState(this.error);

  final AppError error;
}