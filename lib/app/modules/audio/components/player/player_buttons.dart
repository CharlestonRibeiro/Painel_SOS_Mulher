import 'package:flutter/material.dart';

import '../../audio_controller.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _controller.previous,
          color: Colors.white,
          icon: const Icon(Icons.skip_previous),
        ),
        IconButton(
          onPressed: _controller.seekRewind,
          color: Colors.white,
          icon: const Icon(Icons.fast_rewind),
        ),
        ValueListenableBuilder(
          valueListenable: _controller.playingIndex,
          builder: (context, value, child) => value == -1
              ? IconButton(
                  iconSize: 40,
                  onPressed: _controller.playCurrent,
                  color: Colors.white,
                  icon: const Icon(Icons.play_arrow),
                )
              : IconButton(
                  iconSize: 40,
                  onPressed: _controller.pause,
                  color: Colors.white,
                  icon: const Icon(Icons.pause),
                ),
        ),
        IconButton(
          onPressed: _controller.seekForward,
          color: Colors.white,
          icon: const Icon(Icons.fast_forward),
        ),
        IconButton(
          onPressed: _controller.next,
          color: Colors.white,
          icon: const Icon(Icons.skip_next),
        ),
      ],
    );
  }
}
