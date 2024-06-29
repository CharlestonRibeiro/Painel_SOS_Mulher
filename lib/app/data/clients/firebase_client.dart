import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
      return [
        ...result.docs.map((e) {
          final map = e.data();
          map.addAll({'id': e.id});
          return map;
        })
      ];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllFiles() async {
    try {
      final result = await FirebaseStorage.instance.ref().list();
      final list = <Map<String, dynamic>>[];
      for (var idRef in result.prefixes) {
        final docs = await idRef.list();
        for (var docRef in docs.items) {
          final url = await docRef.getDownloadURL();
          list.add({
            'id': idRef.name,
            'url': url,
            'time': docRef.name.split('.')[0],
          });
        }
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getFile(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> post(
    String endpoint,
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      await FirebaseFirestore.instance.doc('$endpoint/$id').update(data);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
