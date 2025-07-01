class Validators {
  static String? validateEmail(String email, {bool isRequired = true}) {
    if (isRequired && email.isEmpty) {
      return 'Email é obrigatório';
    }
    if (!RegExp(
      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
    ).hasMatch(email)) {
      return 'Email inválido';
    }
    return null;
  }

  static String? validatePassword(String password, {bool isRequired = true}) {
    if (isRequired && password.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (password.length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String password,
    String confirmPassword, {
    bool isRequired = true,
  }) {
    if (isRequired && confirmPassword.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }
    if (password != confirmPassword) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  static String? validateName(String name, {bool isRequired = true}) {
    if (isRequired && name.isEmpty) {
      return 'Nome é obrigatório';
    }
    if (name.length < 3) {
      return 'Nome deve ter pelo menos 3 caracteres';
    }
    return null;
  }
}
