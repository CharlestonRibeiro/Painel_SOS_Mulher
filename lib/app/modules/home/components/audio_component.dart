import 'package:flutter/material.dart';

import '../../../core/widgets/audios_listview.dart';
import '../../audio/audio_controller.dart';

class AudioComponent extends StatelessWidget {
  const AudioComponent(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 40,
      child: Container(
        color: Colors.grey.shade50,
        height: MediaQuery.of(context).size.height - 160,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Áudios recebidos',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: AudiosListView(_controller, showPlayingIcons: true),
            ),
          ],
        ),
      ),
    );
  }
}
