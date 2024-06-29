import 'model_errors.dart';

final class Audio {
  final String id;
  final String uid;
  final String url;
  final DateTime time;

  Audio({
    required this.id,
    required this.uid,
    required this.url,
    required this.time,
  });

  factory Audio.fromMap(String id, Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': String uid,
        'url': String url,
        'time': String time,
      } =>
        Audio(
          id: id,
          uid: uid,
          url: url,
          time: DateTime.parse(time.replaceAll('_', ':')),
        ),
      _ => throw DataFormatError(
          map.toString(),
          "{'id': String id, 'url': String url, 'time': String time}",
        ),
    };
  }

  Map<String, dynamic> toMap() => {
        'id': uid,
        'url': url,
        'time': time.toIso8601String(),
      };
}
