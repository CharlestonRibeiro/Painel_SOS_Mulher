import '../../core/errors/app_error_interface.dart';

sealed class HomeState {}

class InitialHomeState implements HomeState {}

class LoadingHomeState implements HomeState {}

class SuccessHomeState implements HomeState {}

class ErrorHomeState implements HomeState {
  ErrorHomeState(this.error);

  final AppError error;
}