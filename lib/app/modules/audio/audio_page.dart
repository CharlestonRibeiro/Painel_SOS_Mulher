import 'package:flutter/material.dart';

import '../../core/routes/navigation_side_bar.dart';
import '../../core/widgets/audios_listview.dart';
import '../home/home_controller.dart';
import 'audio_controller.dart';
import 'components/audio_body.dart';
import 'components/top_bar.dart';

class AudioPage extends StatelessWidget {
  const AudioPage(this._controller, this._homeController, {super.key});

  final AudioController _controller;
  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    _controller.load();
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
                      Expanded(
                        flex: 4,
                        child: AudioBody(_controller, _homeController),
                      ),
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
