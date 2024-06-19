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
    final validatedPassword =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedPassword.hasMatch(value)) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "Dados inválidos";
    }
    return null;
  }

}