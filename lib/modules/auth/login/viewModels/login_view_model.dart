import 'package:flutter/material.dart';
import 'package:modelo_mvvm/modules/auth/login/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;
  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(true);
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _senha = ValueNotifier<String>('');

  String? _lastError;

  LoginViewModel(this._authService);

  ValueNotifier<bool> get passwordVisibility => _passwordVisibility;
  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get senha => _senha;
  String? get lastError => _lastError;

  void togglePasswordVisibility() {
    _passwordVisibility.value = !_passwordVisibility.value;
  }

  Future<bool> handleLogin() async {
    _lastError = null;
    bool loginSuccess = false;

    // Tenta fazer login e captura resultado
    await _authService
        .login(email.value, senha.value)
        .then((result) {
          loginSuccess = true;
        })
        .catchError((error) {
          loginSuccess = false;
          _lastError = error.toString().replaceFirst('Exception: ', '');
        });

    return loginSuccess;
  }
}
