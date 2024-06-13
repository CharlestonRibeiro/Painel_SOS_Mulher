import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/datetime_readable.dart';
import '../../home/home_controller.dart';
import '../audio_controller.dart';
import '../audio_states.dart';
import 'player/audio_player.dart';
import 'position_text.dart';

class AudioBody extends StatelessWidget {
  const AudioBody(this._controller, this._homeController, {super.key});

  final AudioController _controller;
  final HomeController _homeController;

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
              if (index == -1) {
                return const SizedBox.shrink();
              } else {
                final audioData = _controller.allAudios[index];
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Maria Joaquina',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                              Text(
                                audioData.id,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20),
                              Text(audioData.time.toReadable()),
                              PositionText(_homeController, audioData),
                            ],
                          ),
                          Container(
                            color: Colors.grey[400],
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Lorem ipsum...'),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Transcrever'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AudioPlayer(_controller),
                  ],
                );
              }
            },
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
