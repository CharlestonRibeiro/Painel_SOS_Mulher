import 'dart:async';

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

class HomePage extends StatefulWidget {
  const HomePage(this._controller, this._audioController, {super.key});

  final HomeController _controller;
  final AudioController _audioController;

  @override
  State<HomePage> createState() => _HomePageState();
}

const _timerDuration = Duration(seconds: 10);

class _HomePageState extends State<HomePage> {
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    refreshInterval();
  }

  void refreshInterval() {
    widget._controller.load();

    _refreshTimer = Timer.periodic(_timerDuration, (_) {
      widget._controller.load();
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationSideBar(),
          Expanded(
            child: BlocBuilder<HomeController, HomeState>(
              bloc: widget._controller,
              builder: (context, state) {
                return switch (state) {
                  InitialHomeState() ||
                  LoadingHomeState() =>
                    const Center(child: CircularProgressIndicator()),
                  SuccessHomeState() => Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        LocationsMap(widget._controller),
                        const TitleText(),
                        OptionsBar(widget._controller),
                        AudioComponent(widget._audioController),
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
