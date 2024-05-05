import '../../core/errors/app_error_interface.dart';

sealed class AuthState {}

class InitialAuthState implements AuthState {}

class LoadingAuthState implements AuthState {}

class SuccessAuthState implements AuthState {}

class ErrorAuthState implements AuthState {
  ErrorAuthState(this.error);

  final AppError error;
}