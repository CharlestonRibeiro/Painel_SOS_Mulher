import 'package:cloud_firestore/cloud_firestore.dart';

import 'model_errors.dart';

final class Position {
  final String id;
  final double latitude;
  final double longitude;
  final bool alert;
  final String name;
  final DateTime time;

  Position({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.alert,
    required this.name,
    required this.time,
  });

  factory Position.empty() => Position(
        id: '',
        latitude: 0,
        longitude: 0,
        alert: false,
        name: 'Anônimo',
        time: DateTime.now(),
      );

  factory Position.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      // Cenário ideal
      {
        'id': String id,
        'latitude': double lat,
        'longitude': double lng,
        'alert': bool alert,
        'name': String name,
        'updated-at': Timestamp time, 
      } =>
        Position(
          id: id,
          latitude: lat,
          longitude: lng,
          alert: alert,
          name: name,
          time: time.toDate(),
        ),
      // Cenário atual
      {
        'id': String id,
        'latitude': double lat,
        'longitude': double lng,
      } =>
        Position(
          id: id,
          latitude: lat,
          longitude: lng,
          alert: true,
          name: 'Anônimo',
          time: DateTime.now(),
        ),
      // Dados em formato incorreto
      _ => throw DataFormatError(map.toString(),
          "{'id': String, 'latitude':double, 'longitude': double}"),
    };
  }
}
