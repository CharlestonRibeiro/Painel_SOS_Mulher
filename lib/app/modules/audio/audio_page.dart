import 'package:flutter/material.dart';

import '../../core/routes/navigation_side_bar.dart';
import '../../core/widgets/audios_listview.dart';
import 'audio_controller.dart';

class AudioPage extends StatelessWidget {
  const AudioPage(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationSideBar(),
          Expanded(child: AudiosListView(_controller)),
        ],
      ),
    );
  }
}
