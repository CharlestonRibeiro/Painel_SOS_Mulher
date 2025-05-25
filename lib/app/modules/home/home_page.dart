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

class _HomePageState extends State<HomePage> {

  Timer? _refreshtimer;

  @override
  void initState() {
    super.initState();
    refreshInterval();
  }

  void refreshInterval() {
        _refreshtimer = Timer.periodic( const Duration(seconds: 10) , (timer) {
        widget._controller.load();
      });
  }

  @override
  void dispose() {
    _refreshtimer?.cancel();
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
                        TitleText(interval: _refreshtimer?.tick.toString() ?? '0'),
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
