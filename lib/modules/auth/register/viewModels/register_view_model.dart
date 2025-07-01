import 'package:flutter/material.dart';
import 'package:modelo_mvvm/core/utils/validators.dart';
import 'package:modelo_mvvm/modules/auth/register/service/register_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterService _registerService;

  RegisterViewModel(this._registerService);

  final ValueNotifier<String> _name = ValueNotifier<String>('');
  final ValueNotifier<String> _email = ValueNotifier<String>('');
  final ValueNotifier<String> _state = ValueNotifier<String>('');
  final ValueNotifier<String> _password = ValueNotifier<String>('');
  final ValueNotifier<String> _confirmPassword = ValueNotifier<String>('');
  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _confirmPasswordVisibility = ValueNotifier<bool>(
    true,
  );

  ValueNotifier<String> get name => _name;
  ValueNotifier<String> get email => _email;
  ValueNotifier<String> get state => _state;
  ValueNotifier<String> get password => _password;
  ValueNotifier<String> get confirmPassword => _confirmPassword;
  ValueNotifier<bool> get passwordVisibility => _passwordVisibility;
  ValueNotifier<bool> get confirmPasswordVisibility =>
      _confirmPasswordVisibility;

  void togglePasswordVisibility() {
    _passwordVisibility.value = !_passwordVisibility.value;
  }

  void toggleConfirmPasswordVisibility() {
    _confirmPasswordVisibility.value = !_confirmPasswordVisibility.value;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return '';
    }
    return Validators.validateName(name, isRequired: false);
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return '';
    }
    return Validators.validatePassword(password, isRequired: false);
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return '';
    }
    return Validators.validateEmail(email);
  }

  String? validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return '';
    }
    return Validators.validateConfirmPassword(password.value, confirmPassword);
  }

  bool validateForm() {
    if (name.value.isEmpty && email.value.isEmpty && password.value.isEmpty ||
        confirmPassword.value.isEmpty) {
      return false;
    }
    return true;
  }

  Future<void> handleRegister(BuildContext context) async {
    if (validateForm()) {
      await _registerService.register(
        name.value,
        email.value,
        password.value,
        state.value,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _state.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _passwordVisibility.dispose();
    _confirmPasswordVisibility.dispose();
  }
}
