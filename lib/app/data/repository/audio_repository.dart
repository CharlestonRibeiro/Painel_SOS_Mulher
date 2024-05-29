import '../../models/audio_model.dart';
import '../clients/client_interface.dart';

final class AudioRepository {
  AudioRepository(this._client);

  final ClientInterface _client;

  Future<List<Audio>> getAllAudios() async {
    try {
      final data = await _client.getAllFiles();
      final audios = <Audio>[];
      for (var map in data) {
        audios.add(Audio.fromMap(map));
      }
      return audios;
    } catch (e) {
      rethrow;
    }
  }
}
