abstract interface class ClientInterface {
  Future<Map<String, dynamic>> get(String endpoint, String id);
  Future<List<Map<String, dynamic>>> getAll(String endpoint);
  Future<String> getFile(String id);
  Future<List<Map<String, dynamic>>> getAllFiles();
}
