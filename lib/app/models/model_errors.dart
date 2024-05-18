import '../core/errors/app_error_interface.dart';

abstract class ModelError implements AppError {}

final class DataFormatError implements ModelError {
  DataFormatError(this.data, this.expected);

  final String data;
  final String expected;

  @override
  String get message =>
      'Não foi possível construir o objeto.\n\nDADOS RECEBIDOS:\n$data\n\nDADOS ESPERADOS:\n$expected';
}
