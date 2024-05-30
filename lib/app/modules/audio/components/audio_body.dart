import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:painel_sos_mulher/app/modules/audio/audio_controller.dart';
import 'package:painel_sos_mulher/app/modules/audio/audio_states.dart';

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
            builder: (context, value, child) => value == -1
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        _controller
                            .allAudios[_controller.selectedIndex.value].id,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
