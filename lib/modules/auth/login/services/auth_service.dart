import 'package:firebase_auth/firebase_auth.dart';
import 'package:modelo_mvvm/modules/auth/login/models/auth_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthService();

  Future<AuthModel> login(String email, String senha) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: senha);

      final String? idToken = await userCredential.user?.getIdToken();

      return AuthModel(
        accessToken: idToken ?? '',
        refreshToken: userCredential.user?.uid ?? '',
      );
    } on FirebaseAuthException catch (e) {
      // Trata erros específicos do Firebase
      if (e.code == 'user-not-found') {
        throw Exception('Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        throw Exception('Senha incorreta');
      } else if (e.code == 'invalid-email') {
        throw Exception('Email inválido');
      } else if (e.code == 'user-disabled') {
        throw Exception('Usuário desabilitado');
      } else {
        throw Exception('Erro ao fazer login: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<AuthModel> register(String email, String senha) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      final String? idToken = await userCredential.user?.getIdToken();

      return AuthModel(
        accessToken: idToken ?? '',
        refreshToken: userCredential.user?.uid ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('Este email já está em uso');
      } else if (e.code == 'invalid-email') {
        throw Exception('Email inválido');
      } else {
        throw Exception('Erro ao criar conta: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
