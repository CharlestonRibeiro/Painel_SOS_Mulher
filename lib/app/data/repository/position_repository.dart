import 'dart:developer';

import '../../models/position_model.dart';
import '../clients/client_interface.dart';

final class PositionRepository {
  PositionRepository(this._client);

  final ClientInterface _client;

  Future<List<Position>> getAllPositions() async {
    try {
      final data = await _client.getAll('location');
      final positions = <Position>[];
      for (var map in data) {
        try {
          positions.add(Position.fromMap(map));
        } catch (e) {
          log('Erro ao converter o mapa para Position: $e');
        }
      }
      return positions;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deactivateAlert(String id) async {
    try {
      return await _client.post('location', id, {'alert': false});
    } catch (e) {
      rethrow;
    }
  }
}
