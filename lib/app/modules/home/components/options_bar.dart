import 'package:flutter/material.dart';

class OptionsBar extends StatelessWidget {
  const OptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 40,
      child: Row(
        children: [
          SearchAnchor.bar(
            constraints: const BoxConstraints.expand(
              width: 360.0,
              height: 40.0,
            ),
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
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.my_location),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.map),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.zoom_in),
          ),
        ],
      ),
    );
  }
}
