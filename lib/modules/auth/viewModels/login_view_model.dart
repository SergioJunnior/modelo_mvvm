import 'package:flutter/material.dart';
import 'package:modelo_mvvm/modules/auth/models/auth_model.dart';
import 'package:modelo_mvvm/modules/auth/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _senha = ValueNotifier<String>('');

  LoginViewModel(this._authRepository);

  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get senha => _senha;

  _handleLogin(BuildContext context, AuthModel authModel) async {
    final success = await _authRepository.login(email.value, senha.value);
    if (success) {
      print(authModel);
    }
  }
}
