import 'model_errors.dart';

final class Position {
  final String id;
  final double latitude;
  final double longitude;

  Position({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory Position.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': String id,
        'latitude': double lat,
        'longitude': double lng,
      } =>
        Position(
          id: id,
          latitude: lat,
          longitude: lng,
        ),
      _ => throw DataFormatError(
          map.toString(), "{'id': String, 'latitude':double, 'longitude': double}"),
    };
  }
}
