import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  final String accessToken;
  final String refreshToken;

  AuthModel({required this.accessToken, required this.refreshToken});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  static Future<AuthModel> fromFirebaseUser(User user) async {
    final idToken = await user.getIdToken();
    return AuthModel(accessToken: idToken ?? '', refreshToken: user.uid);
  }
}
