import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_mvvm/core/dependecies/auth/auth_depencies.dart';
import 'package:modelo_mvvm/core/design_system/components/auth/text_field_component.dart';
import 'package:modelo_mvvm/modules/auth/register/viewModels/register_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerViewModel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text('Cadastro', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            const Text(
              'Faça seu cadastro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _registerViewModel.name,
                      builder: (context, snapshot, _) {
                        return TextFieldComponent(
                          hintText: 'Digite seu nome',
                          onChanged: (value) {
                            _registerViewModel.name.value = value;
                          },
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 22,
                            color: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _registerViewModel.email,
                      builder: (context, snapshot, _) {
                        return TextFieldComponent(
                          keyBoardType: TextInputType.emailAddress,
                          errorText: _registerViewModel.validateEmail(snapshot),
                          hintText: 'Digite seu email',
                          onChanged: (value) {
                            _registerViewModel.email.value = value;
                          },
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 22,
                            color: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Estado(Opcional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _registerViewModel.state,
                      builder: (context, snapshot, _) {
                        return TextFieldComponent(
                          hintText: 'Digite seu estado (ex: SP)',
                          onChanged: (value) {},
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            size: 22,
                            color: Colors.deepPurple,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Senha',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _registerViewModel.passwordVisibility,
                      builder: (context, snapshot, _) {
                        return TextFieldComponent(
                          hintText: 'Digite sua senha',
                          obscureText: snapshot,
                          onChanged: (value) {
                            _registerViewModel.password.value = value;
                          },
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
                          onSuffixIconPressed:
                              _registerViewModel.togglePasswordVisibility,
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirme a senha',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          _registerViewModel.confirmPasswordVisibility,
                      builder: (context, snapshot, _) {
                        return TextFieldComponent(
                          obscureText: snapshot,
                          hintText: 'Confirme sua senha',
                          onChanged: (value) {
                            _registerViewModel.confirmPassword.value = value;
                          },
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
                          onSuffixIconPressed:
                              _registerViewModel
                                  .toggleConfirmPasswordVisibility,
                        );
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    _registerViewModel.handleRegister(context);
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
