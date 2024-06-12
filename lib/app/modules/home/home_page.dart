import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/navigation_side_bar.dart';
import '../audio/audio_controller.dart';
import 'components/audio_component.dart';
import 'components/locations_map.dart';
import 'components/options_bar.dart';
import 'components/title.dart';
import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, this._audioController, {super.key});

  final HomeController _controller;
  final AudioController _audioController;

  @override
  Widget build(BuildContext context) {
    _controller.load();
    return Scaffold(
      body: Row(
        children: [
          const NavigationSideBar(),
          Expanded(
            child: BlocBuilder<HomeController, HomeState>(
              bloc: _controller,
              builder: (context, state) {
                return switch (state) {
                  InitialHomeState() ||
                  LoadingHomeState() =>
                    const Center(child: CircularProgressIndicator()),
                  SuccessHomeState() => Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        LocationsMap(_controller),
                        const TitleText(),
                        const OptionsBar(),
                        AudioComponent(_audioController),
                      ],
                    ),
                  ErrorHomeState() => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
