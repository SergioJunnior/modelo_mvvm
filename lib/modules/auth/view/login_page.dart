import 'package:flutter/material.dart';
import 'package:modelo_mvvm/core/dependecies/configure_dependencies.dart';
import 'package:modelo_mvvm/modules/auth/viewModels/login_view_model.dart';

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
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            ValueListenableBuilder(
              valueListenable: _loginViewModel.email,
              builder: (context, snapshot, _) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    _loginViewModel.email.value = value;
                  },
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _loginViewModel.senha,
              builder: (context, snapshot, _) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    _loginViewModel.senha.value = value;
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                _loginViewModel.handleLogin(context);
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
