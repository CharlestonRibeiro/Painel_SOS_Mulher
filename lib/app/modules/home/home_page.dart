import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/locations_map.dart';
import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller.load();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel SOS'),
      ),
      body: BlocBuilder<HomeController, HomeState>(
        bloc: _controller,
        builder: (context, state) {
          return switch (state) {
            LoadingHomeState() =>
              const Center(child: CircularProgressIndicator()),
            SuccessHomeState() => LocationsMap(_controller),
            ErrorHomeState() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
