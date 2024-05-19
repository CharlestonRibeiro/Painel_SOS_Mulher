import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

import '../home_controller.dart';

class LocationsMap extends StatelessWidget {
  const LocationsMap(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        interactionOptions:
            const InteractionOptions(enableMultiFingerGestureRace: true),
        initialCenter: LatLng(
          _controller.allPositions[0].latitude,
          _controller.allPositions[0].longitude,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        ..._controller.allPositions.map(
          (e) => LocationMarkerLayer(
            position: LocationMarkerPosition(
              latitude: e.latitude,
              longitude: e.longitude,
              accuracy: 0.1,
            ),
            style: const LocationMarkerStyle(
              marker: Icon(
                Icons.location_pin,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
