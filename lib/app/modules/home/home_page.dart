import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
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
            SuccessHomeState() => ListView.builder(
                itemCount: _controller.allPositions.length,
                itemBuilder: (context, index) =>
                    Text(_controller.allPositions[index].id),
              ),
            ErrorHomeState() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
