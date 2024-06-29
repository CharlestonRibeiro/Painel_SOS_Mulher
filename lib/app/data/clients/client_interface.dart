abstract interface class ClientInterface {
  Future<Map<String, dynamic>> get(String endpoint, String id);
  Future<List<Map<String, dynamic>>> getAll(String endpoint);
  Future<List<(String, Map<String, dynamic>)>> getAllById(String endpoint);
  Future<List<Map<String, dynamic>>> getAllFiles();
  Future<bool> post(String endpoint, String id, Map<String, dynamic> data);
  Future<bool> create(String endpoint, Map<String, dynamic> data);
  Future<bool> delete(String endpoint, String id);
}
