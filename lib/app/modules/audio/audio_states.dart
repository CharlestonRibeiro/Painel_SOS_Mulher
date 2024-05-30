import '../../core/errors/app_error_interface.dart';

sealed class AudioState {}

class InitialAudioState implements AudioState {}

class LoadingAudioState implements AudioState {}

class SuccessAudioState implements AudioState {}

class ErrorAudioState implements AudioState {
  ErrorAudioState(this.error);

  final AppError error;
}