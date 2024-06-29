import '../../core/errors/app_error_interface.dart';

sealed class AudioState {}

class InitialAudioState implements AudioState {}

class LoadingAudioState implements AudioState {}

class SuccessAudioState implements AudioState {
  SuccessAudioState([this.message]);

  final String? message;
}

class ErrorAudioState implements AudioState {
  ErrorAudioState(this.error);

  final AppError error;
}
