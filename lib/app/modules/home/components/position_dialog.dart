import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../../../models/position_model.dart';
import '../home_controller.dart';

class PositionDialog extends StatelessWidget {
  const PositionDialog(
    this.position, {
    required HomeController controller,
    super.key,
  }) : _controller = controller;

  final Position position;
  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        position.name,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(position.id),
          const SizedBox(height: 8),
          Text('(${position.latitude}, ${position.longitude})'),
        ],
      ),
      actions: position.alert
          ? [
              ElevatedButton(
                onPressed: () => _controller
                    .deactivateAlert(position)
                    .then((result) => result ? Routes.i.maybePop() : {}),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Desativar alerta'),
              ),
            ]
          : null,
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
