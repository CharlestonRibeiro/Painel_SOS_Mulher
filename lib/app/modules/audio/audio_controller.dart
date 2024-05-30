import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/errors/app_error_interface.dart';
import '../../data/repository/audio_repository.dart';
import '../../models/audio_model.dart';
import 'audio_states.dart';

class AudioController extends Cubit<AudioState> {
  AudioController(this._repo) : super(InitialAudioState()) {
    _player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        playingIndex.value = -1;
        _player.stop();
        _player.seek(null);
      }
    });
  }

  final AudioRepository _repo;
  final allAudios = <Audio>[];
  final durations = <String>[];
  final _player = AudioPlayer();
  final selectedIndex = ValueNotifier(-1);
  final playingIndex = ValueNotifier(-1);

  Future<void> load() async {
    if (state is! LoadingAudioState) {
      emit(LoadingAudioState());
      try {
        allAudios.clear();
        durations.clear();
        allAudios.addAll(await _repo.getAllAudios());
        for (var audio in allAudios) {
          final duration = await _player.setUrl(audio.url);
          durations.add(duration.toString().split('.')[0]);
        }
        emit(SuccessAudioState());
      } on AppError catch (e) {
        emit(ErrorAudioState(e));
      }
    }
  }

  Future<void> play(int index) async {
    playingIndex.value = index;
    await _player.setUrl(allAudios[index].url);
    await _player.play();
  }

  void select(int index) {
    selectedIndex.value = index;
    play(index);
  }

  void previous() {
    if (selectedIndex.value > 0) {
      selectedIndex.value = selectedIndex.value - 1;
      play(selectedIndex.value);
    }
  }

  void next() {
    if (selectedIndex.value < allAudios.length - 1) {
      selectedIndex.value = selectedIndex.value + 1;
      play(selectedIndex.value);
    }
  }

  void seekRewind() {
    if (_player.position > const Duration(seconds: 2)) {
      _player.seek(Duration(seconds: _player.position.inSeconds - 2));
    } else {
      _player.seek(null);
    }
  }

  void seekForward() {
    final max = _player.duration ?? Duration.zero;
    if (_player.position < Duration(seconds: max.inSeconds - 2)) {
      _player.seek(Duration(seconds: _player.position.inSeconds + 2));
    } else {
      playingIndex.value = -1;
      _player.stop();
      _player.seek(null);
    }
  }

  void pause() {
    playingIndex.value = -1;
    _player.pause();
  }

  void playCurrent() {
    playingIndex.value = selectedIndex.value;
    _player.play();
  }
}
