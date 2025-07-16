import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_mvvm/core/dependecies/configure_dependencies.dart';
import 'package:modelo_mvvm/core/design_system/components/auth/text_field_component.dart';
import 'package:modelo_mvvm/modules/auth/login/viewModels/login_view_model.dart';
import 'package:modelo_mvvm/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginViewModel = getIt<LoginViewModel>();

  @override
  void dispose() {
    super.dispose();
    _loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            const Icon(Icons.facebook, size: 100, color: Colors.deepPurple),
            ValueListenableBuilder(
              valueListenable: _loginViewModel.email,
              builder: (context, snapshot, _) {
                return TextFieldComponent(
                  keyBoardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  onChanged: (value) {
                    _loginViewModel.email.value = value;
                  },
                  //errorText: 'Email Inválido',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.deepPurple,
                    size: 22,
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _loginViewModel.passwordVisibility,
              builder: (context, snapshot, _) {
                return TextFieldComponent(
                  hintText: 'Senha',
                  obscureText: snapshot,
                  onChanged: (value) {
                    _loginViewModel.senha.value = value;
                  },
                  //errorText: 'Senha Inválido',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    size: 22,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon:
                      snapshot == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(
                            Icons.visibility_outlined,
                            color: Colors.deepPurple,
                          ),
                  onSuffixIconPressed: _loginViewModel.togglePasswordVisibility,
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
                final success = await _loginViewModel.handleLogin();

                if (success) {
                  // Login bem-sucedido - navega para home
                  if (mounted) {
                    context.go(Routes.home);
                  }
                } else {
                  // Login falhou - mostra SnackBar
                  if (mounted) {
                    try {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _loginViewModel.lastError ?? 'Erro desconhecido',
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(seconds: 4),
                        ),
                      );
                    } catch (e) {
                      debugPrint('Erro ao mostrar SnackBar: $e');
                    }
                  }
                }
              },
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
              onPressed: () {
                context.push(Routes.register);
              },
              child: const Text(
                'Cadastre-se',
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
