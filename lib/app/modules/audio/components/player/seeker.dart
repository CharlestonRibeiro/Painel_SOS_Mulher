import 'package:flutter/material.dart';
import 'package:painel_sos_mulher/app/modules/audio/audio_controller.dart';

class Seeker extends StatelessWidget {
  const Seeker(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    final index = _controller.selectedIndex.value;
    return StreamBuilder<Duration>(
      stream: _controller.positionStream,
      builder: (context, snapshot) {
        final position = snapshot.data ?? Duration.zero;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
              child: Slider(
                value: position.inMilliseconds /
                    _controller.durations[index].$1.inMilliseconds,
                onChanged: (_) {},
                activeColor: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  position.toString().split('.')[0],
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  _controller.durations[index].$2,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
