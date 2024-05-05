abstract interface class AppError implements Exception {
  AppError(this.message);

  /// Mensagem de erro para logs e apresentação ao usuário.
  ///
  /// Portanto, deve ser em português.
  final String message;
}

abstract interface class ClientError implements AppError {}

abstract interface class StorageError implements AppError {}

abstract interface class DataError implements AppError {}