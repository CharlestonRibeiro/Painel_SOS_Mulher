import '../../models/audio_model.dart';
import '../clients/client_interface.dart';

final class AudioRepository {
  AudioRepository(this._client);

  final ClientInterface _client;

  Future<List<Audio>> getActiveAudios() async {
    try {
      final data = await _client.getAllById('active-audios');
      final audios = <Audio>[];
      for (var (id, map) in data) {
        audios.add(Audio.fromMap(id, map));
      }
      audios.sort((a, b) => a.time.compareTo(b.time));
      return audios;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Audio>> getDismissedAudios() async {
    try {
      final data = await _client.getAllById('dismissed-audios');
      final audios = <Audio>[];
      for (var (id, map) in data) {
        audios.add(Audio.fromMap(id, map));
      }
      audios.sort((a, b) => a.time.compareTo(b.time));
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
