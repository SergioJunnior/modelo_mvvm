import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_mvvm/modules/auth/login/services/auth_service.dart';
import 'package:modelo_mvvm/routes/routes.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;
  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(true);
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _senha = ValueNotifier<String>('');

  LoginViewModel(this._authService);

  ValueNotifier<bool> get passwordVisibility => _passwordVisibility;
  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get senha => _senha;

  void togglePasswordVisibility() {
    _passwordVisibility.value = !_passwordVisibility.value;
  }

  Future<void> handleLogin(BuildContext context) async {
    String? errorMessage;
    bool loginSuccess = false;

    // Tenta fazer login e captura resultado
    await _authService
        .login(email.value, senha.value)
        .then((result) {
          loginSuccess = true;
        })
        .catchError((error) {
          loginSuccess = false;
          errorMessage = error.toString().replaceFirst('Exception: ', '');
        });

    if (loginSuccess) {
      // Login bem-sucedido - navega para home
      if (context.mounted) {
        context.go(Routes.home);
      }
    } else {
      // Login falhou - mostra erro no SnackBar
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage ?? 'Erro desconhecido'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }
}
