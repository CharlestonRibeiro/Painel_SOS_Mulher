import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/audio_model.dart';
import '../../../models/position_model.dart';
import '../../home/home_controller.dart';
import '../../home/home_states.dart';

class PositionText extends StatelessWidget {
  const PositionText(this._homeController, this.audioData, {super.key});

  final HomeController _homeController;
  final Audio audioData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      bloc: _homeController,
      builder: (context, state) {
        final position = _homeController.allPositions.firstWhere(
          (e) => e.id == audioData.id,
          orElse: Position.empty,
        );
        return switch (state) {
          SuccessHomeState() => Text(
              '(${position.latitude}, ${position.longitude})',
            ),
          _ => const Text(''),
        };
      },
    );
  }
}
