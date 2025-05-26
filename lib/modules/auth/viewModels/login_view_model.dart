import 'package:flutter/material.dart';
import 'package:modelo_mvvm/modules/auth/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _senha = ValueNotifier<String>('');

  LoginViewModel(this._authRepository);

  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get senha => _senha;

  Future<void> handleLogin(BuildContext context) async {
    await _authRepository.login(email.value, senha.value);
  }
}
