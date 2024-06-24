abstract final class FormValidator {
  static String? validateEmail(String? value) {
    final validatedEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedEmail.hasMatch(value)) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final RegExp validatedPassword =
        RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$");

    if (value == null || value.isEmpty) {
      return "Campo obrigatório.";
    }
    if (!validatedPassword.hasMatch(value)) {
      return "Deve conter 6 caracteres, letras e números.";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "As senhas não coincidem.";
    }
    return null;
  }
}
