import 'package:flutter/material.dart';

import '../../../core/extensions/datetime_readable.dart';
import '../../../core/extensions/string_ignorecase.dart';
import '../audio_controller.dart';

class TopBar extends StatelessWidget {
  const TopBar(this._controller, {super.key});

  final AudioController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            'ÁUDIOS RECEBIDOS',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SearchAnchor.bar(
              constraints: const BoxConstraints.expand(height: 40.0),
              barElevation: const MaterialStatePropertyAll(0),
              barShape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(),
              ),
              viewShape: const RoundedRectangleBorder(),
              suggestionsBuilder: (context, controller) {
                final suggestions = [
                  ..._controller.dismissedAudios.where(
                      (e) => e.username.containsIgnoreCase(controller.text)),
                ];
                suggestions.addAll(
                  _controller.activeAudios.where(
                      (e) => e.username.containsIgnoreCase(controller.text)),
                );
                return suggestions.map(
                  (e) => ListTile(
                    title: Text(e.username),
                    subtitle: Text(e.time.toReadable()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
