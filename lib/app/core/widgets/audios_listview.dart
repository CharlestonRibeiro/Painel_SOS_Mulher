import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/audio/audio_controller.dart';
import '../../modules/audio/audio_states.dart';
import 'audio_tile.dart';

class AudiosListView extends StatelessWidget {
  const AudiosListView(
    this._controller, {
    super.key,
    this.showPlayingIcons = false,
  });

  final AudioController _controller;
  final bool showPlayingIcons;

  @override
  Widget build(BuildContext context) {
    _controller.load();
    return BlocBuilder<AudioController, AudioState>(
      bloc: _controller,
      builder: (context, state) {
        return switch (state) {
          LoadingAudioState() ||
          InitialAudioState() =>
            const Center(child: CircularProgressIndicator()),
          SuccessAudioState() => ListView.builder(
              itemCount: _controller.allAudios.length,
              itemBuilder: (context, index) => ValueListenableBuilder(
                valueListenable: _controller.playingIndex,
                builder: (context, value, child) => AudioTile(
                  showPlayingIcon: showPlayingIcons,
                  isSelected: index == _controller.selectedIndex.value,
                  isPlaying: index == _controller.playingIndex.value,
                  index: index + 1,
                  id: _controller.allAudios[index].uid,
                  duration: _controller.durations[index].$2,
                  playFunction: () => _controller.select(index),
                ),
              ),
            ),
          ErrorAudioState() => const SizedBox.shrink(),
        };
      },
    );
  }
}
