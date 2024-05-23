import 'package:flutter/material.dart';

import 'audio_tile.dart';

class AudioComponent extends StatelessWidget {
  const AudioComponent({super.key});

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
              // TODO: dinamizar valores (audios module)
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => AudioTile(
                  isSelected: index == 0,
                  isPlaying: index == 0,
                  index: index + 1,
                  id: 'U87YTFGVHBJIUYFHRTTGHJE6RTG',
                  duration: '0:45',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
