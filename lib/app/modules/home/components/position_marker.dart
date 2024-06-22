import 'package:flutter/material.dart';

import '../../../models/position_model.dart';

class PositionMarker extends StatelessWidget {
  const PositionMarker(this.position, {super.key});

  final Position position;

  @override
  Widget build(BuildContext context) {
    return position.alert
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SOS RECEBIDO\n${position.name}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Icon(Icons.location_history, color: Colors.red),
            ],
          )
        : const Icon(Icons.location_pin, color: Colors.green);
  }
}
