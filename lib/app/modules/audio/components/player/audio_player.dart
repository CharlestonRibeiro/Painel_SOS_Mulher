import 'package:flutter/material.dart';

import '../../audio_controller.dart';
import 'player_buttons.dart';
import 'seeker.dart';

class AudioPlayer extends StatelessWidget {
  const AudioPlayer(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 132,
      padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PlayerButtons(_controller),
          Seeker(_controller),
        ],
      ),
    );
  }
}
