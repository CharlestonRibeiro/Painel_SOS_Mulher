import 'package:flutter/material.dart';

import '../../../models/position_model.dart';

class PositionDialog extends StatelessWidget {
  const PositionDialog(this.position, {super.key});

  final Position position;

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
                onPressed: () {},
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
