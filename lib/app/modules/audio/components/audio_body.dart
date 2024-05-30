import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../audio_controller.dart';
import '../audio_states.dart';
import 'player/audio_player.dart';

class AudioBody extends StatelessWidget {
  const AudioBody(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioController, AudioState>(
      bloc: _controller,
      builder: (context, state) => switch (state) {
        LoadingAudioState() => const Center(
            child: CircularProgressIndicator(),
          ),
        SuccessAudioState() => ValueListenableBuilder(
            valueListenable: _controller.selectedIndex,
            builder: (context, index, child) {
              return index == -1
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                _controller.allAudios[index].id,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        AudioPlayer(_controller),
                      ],
                    );
            },
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
