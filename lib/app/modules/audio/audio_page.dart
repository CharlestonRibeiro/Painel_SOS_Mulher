import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/navigation_side_bar.dart';
import '../home/components/audio_component.dart';
import 'audio_controller.dart';
import 'audio_states.dart';

class AudioPage extends StatelessWidget {
  const AudioPage(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    _controller.load();
    return Scaffold(
      body: Row(
        children: [
          const NavigationSideBar(),
          Expanded(
            child: BlocBuilder<AudioController, AudioState>(
              bloc: _controller,
              builder: (context, state) {
                return switch (state) {
                  LoadingAudioState() =>
                    const Center(child: CircularProgressIndicator()),
                  SuccessAudioState() => const AudioComponent(),
                  ErrorAudioState() => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
