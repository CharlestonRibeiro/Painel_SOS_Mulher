import 'package:cloud_firestore/cloud_firestore.dart';

import 'model_errors.dart';

final class Audio {
  final String id;
  final double latitude;
  final double longitude;
  final String url;
  final DateTime time;

  Audio({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.url,
    required this.time,
  });

  factory Audio.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': String id,
        'latitude': double lat,
        'longitude': double lng,
        'url': String url,
        'time': Timestamp time,
      } =>
        Audio(
          id: id,
          latitude: lat,
          longitude: lng,
          url: url,
          time: time.toDate(),
        ),
      {
        'id': String id,
        'url': String url,
        'time': String time,
      } =>
        Audio(
          id: id,
          latitude: 0,
          longitude: 0,
          url: url,
          time:
              DateTime.parse(time.replaceAll('.aac', '').replaceAll('_', ':')),
        ),
      _ => throw DataFormatError(
          map.toString(),
          "{'id': String id, 'latitude': double lat, 'longitude': double lng, 'file': File file, 'time': Timestamp time}",
        ),
    };
  }
}
