import '../../../core/errors/app_error_interface.dart';

final class PasswordRecoveryEmailSent implements AppError {
  PasswordRecoveryEmailSent(this.email);

  final String email;

  @override
  String get message =>
      'Um e-mail de recuperação de senha foi enviado para: $email';
}
