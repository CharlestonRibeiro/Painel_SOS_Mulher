import 'package:flutter/material.dart';

import '../../core/routes/navigation_side_bar.dart';
import '../../core/widgets/audios_listview.dart';
import 'audio_controller.dart';
import 'components/audio_body.dart';
import 'components/top_bar.dart';

class AudioPage extends StatelessWidget {
  const AudioPage(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationSideBar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: AudioBody(_controller)),
                      Expanded(child: AudiosListView(_controller)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
