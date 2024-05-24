abstract interface class ClientInterface {
  Future<Map<String, dynamic>> get(String endpoint, String id);
  Future<List<Map<String, dynamic>>> getAll(String endpoint);
}
