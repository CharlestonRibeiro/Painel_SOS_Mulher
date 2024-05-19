import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/locations_map.dart';
import 'components/title.dart';
import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller.load();
    return Scaffold(
      body: BlocBuilder<HomeController, HomeState>(
        bloc: _controller,
        builder: (context, state) {
          return switch (state) {
            LoadingHomeState() =>
              const Center(child: CircularProgressIndicator()),
            SuccessHomeState() => Stack(
                fit: StackFit.expand,
                children: [
                  LocationsMap(_controller),
                  const TitleText(),
                ],
              ),
            ErrorHomeState() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
