import 'package:dio/dio.dart';
import 'package:modelo_mvvm/core/dio/dio_client.dart';
import 'package:modelo_mvvm/modules/auth/models/auth_model.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient, [Dio? dio]);

  Future<AuthModel> login(String email, String senha) async {
    try {
      final response = await _dioClient.post(
        'https://api.escuelajs.co/api/v1/auth/login',
        {'email': "jhon@mail.com", 'password': "changeme"},
      );

      return AuthModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }
}
