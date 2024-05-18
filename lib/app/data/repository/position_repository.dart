import '../../models/position_model.dart';
import '../clients/client_interface.dart';

final class PositionRepository {
  PositionRepository(this._client);

  final ClientInterface _client;

  Future<List<Position>> getAllPositions() async {
    try {
      final data = await _client.getAll('location');
      final positions = List<Position>.empty();
      for (var map in data) {
        positions.add(Position.fromMap(map));
      }
      return positions;
    } catch (e) {
      rethrow;
    }
  }
}
