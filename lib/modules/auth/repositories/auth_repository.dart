import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> logout() async {
    await _authService.logout();
  }

  User? get currentUser => _authService.currentUser;

  Stream<User?> get authStateChanges => _authService.authStateChanges;

  Future<AuthModel?> getCurrentUserModel() async {
    final user = currentUser;
    if (user != null) {
      return await AuthModel.fromFirebaseUser(user);
    }
    return null;
  }
}
