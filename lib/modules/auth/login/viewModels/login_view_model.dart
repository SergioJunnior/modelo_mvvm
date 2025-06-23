import 'package:flutter/material.dart';
import 'package:modelo_mvvm/modules/auth/login/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(true);
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _senha = ValueNotifier<String>('');

  LoginViewModel(this._authRepository);

  ValueNotifier<bool> get passwordVisibility => _passwordVisibility;
  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get senha => _senha;

  void togglePasswordVisibility() {
    _passwordVisibility.value = !_passwordVisibility.value;
  }

  Future<void> handleLogin(BuildContext context) async {
    await _authRepository.login(email.value, senha.value);
  }
}
