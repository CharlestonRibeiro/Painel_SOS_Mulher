import '../../models/audio_model.dart';
import '../clients/client_interface.dart';

final class AudioRepository {
  AudioRepository(this._client);

  final ClientInterface _client;

  Future<List<Audio>> getAllAudios() async {
    try {
      final data = await _client.getAllById('active-audios');
      final audios = <Audio>[];
      for (var (id, map) in data) {
        audios.add(Audio.fromMap(id, map));
      }
      return audios;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> dismissAudio(Audio audio) async {
    try {
      await _client.create('dismissed-audios', audio.toMap());
      return await _client.delete('active-audios', audio.id);
    } catch (e) {
      rethrow;
    }
  }
}
