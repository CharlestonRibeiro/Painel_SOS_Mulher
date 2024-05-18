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

  factory Position.fromMap(String id, Map<String, dynamic> map) {
    return switch (map) {
      {'latitude': double lat, 'longitude': double lng} => Position(
          id: id,
          latitude: lat,
          longitude: lng,
        ),
      _ => throw DataFormatError(
          map.toString(), "{'latitude':double, 'longitude': double}"),
    };
  }
}
