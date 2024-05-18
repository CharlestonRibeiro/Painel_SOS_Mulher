import 'package:cloud_firestore/cloud_firestore.dart';

import 'client_errors.dart';
import 'client_interface.dart';

final class FirebaseClient implements ClientInterface {
  @override
  Future<Map<String, dynamic>> get(String endpoint, String id) async {
    try {
      final result =
          await FirebaseFirestore.instance.doc('$endpoint/$id').get();
      if (result.data() case final data?) {
        return data;
      } else {
        throw DataNotFoundError('$endpoint/$id');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String endpoint) async {
    try {
      final result =
          await FirebaseFirestore.instance.collection(endpoint).get();
      if (result.size != 0) {
        return [...result.docs.map((e) => e.data())];
      } else {
        throw EmptyCollectionError(endpoint);
      }
    } catch (e) {
      rethrow;
    }
  }
}
