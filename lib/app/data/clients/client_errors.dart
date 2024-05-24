import '../../core/errors/app_error_interface.dart';

abstract class ClientError implements AppError {}

final class DataNotFoundError implements ClientError {
  DataNotFoundError(this.path);

  final String path;

  @override
  String get message => 'Não foram encontrados dados na requisição:\n$path';
}

final class EmptyCollectionError implements ClientError {
  EmptyCollectionError(this.collection);

  final String collection;

  @override
  String get message => 'A coleção "$collection" está vazia.';
}

final class FirebaseError implements ClientError {
  @override
  // TODO: implement message
  String get message => throw UnimplementedError();
}
