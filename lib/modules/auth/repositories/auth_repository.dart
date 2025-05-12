import 'package:modelo_mvvm/modules/auth/models/auth_model.dart';
import 'package:modelo_mvvm/modules/auth/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<AuthModel?> login(String email, String senha) async {
    try {
      final userData = await _authService.login(email, senha);
      return userData;
    } catch (e) {
      return null;
    }
  }
}
