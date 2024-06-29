import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/datetime_readable.dart';
import '../../../core/routes/routes.dart';
import '../../../models/position_model.dart';
import '../../home/home_controller.dart';
import '../../home/home_states.dart';
import '../audio_controller.dart';
import '../audio_states.dart';
import 'player/audio_player.dart';

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
                      child: BlocBuilder<HomeController, HomeState>(
                        bloc: _homeController,
                        builder: (context, state) {
                          final position =
                              _homeController.allPositions.firstWhere(
                            (e) => e.id == audioData.id,
                            orElse: Position.empty,
                          );
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                position.name,
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
                              switch (state) {
                                SuccessHomeState() => Text(
                                    '(${position.latitude}, ${position.longitude})',
                                  ),
                                _ => const Text('Carregando localização...'),
                              },
                              const SizedBox(height: 40),
                              FloatingActionButton.extended(
                                elevation: 0,
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Arquivar'),
                                    content: const Text(
                                        'Tem certeza que deseja arquivar este áudio?'),
                                    actions: [
                                      FilledButton(
                                        onPressed: () {
                                          _controller.dismiss();
                                          Routes.i.maybePop();
                                        },
                                        child: const Text('Arquivar'),
                                      ),
                                    ],
                                  ),
                                ),
                                label: const Text('ARQUIVAR'),
                              ),
                            ],
                          );
                        },
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
