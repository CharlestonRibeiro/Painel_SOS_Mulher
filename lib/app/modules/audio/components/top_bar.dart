import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

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
              suggestionsBuilder: (
                BuildContext context,
                SearchController controller,
              ) =>
                  [],
            ),
          ),
        ],
      ),
    );
  }
}
