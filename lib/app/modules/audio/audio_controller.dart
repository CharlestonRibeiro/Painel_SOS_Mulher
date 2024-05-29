import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/audio_repository.dart';
import '../../models/audio_model.dart';
import 'audio_states.dart';

class AudioController extends Cubit<AudioState> {
  AudioController(this._repo) : super(LoadingAudioState());

  final AudioRepository _repo;
  final allAudios = <Audio>[];

  Future<void> load() async {
    emit(LoadingAudioState());
    try {
      allAudios.addAll(await _repo.getAllAudios());
      emit(SuccessAudioState());
    } on AppError catch (e) {
      emit(ErrorAudioState(e));
    }
  }
}
