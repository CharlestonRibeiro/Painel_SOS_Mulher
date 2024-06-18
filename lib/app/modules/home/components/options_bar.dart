import 'dart:async';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../home_controller.dart';

class OptionsBar extends StatelessWidget {
  const OptionsBar(this._homeController, {super.key});

  final HomeController _homeController;

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
            barShape: const MaterialStatePropertyAll(RoundedRectangleBorder()),
            viewShape: const RoundedRectangleBorder(),
            suggestionsBuilder: _buildSuggestions,
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

  FutureOr<Iterable<Widget>> _buildSuggestions(
    BuildContext context,
    SearchController controller,
  ) =>
      _homeController.allPositions
          .where((e) =>
              e.name.toLowerCase().contains(controller.text.toLowerCase()) ||
              e.id.toLowerCase().contains(controller.text.toLowerCase()))
          .map(
            (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.id),
              leading: e.alert
                  ? const Icon(
                      Icons.priority_high,
                      color: Colors.red,
                    )
                  : null,
              onTap: () => _homeController.mapController
                  .move(LatLng(e.latitude, e.longitude), 18),
            ),
          );
}
