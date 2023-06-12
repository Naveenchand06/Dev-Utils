import 'package:dio/dio.dart';
import 'package:sharada_app/utils/network_util/dio_provider.dart';

class Authenticator {
  Authenticator();

  final _dio = getAppDio();

  Future<Response> login({
    required String email,
    required String pass,
  }) async {
    try {
      Response res = await _dio.post('/api/auth/login', data: {
        "email": email,
        "password": pass,
      });
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register({
    required String name,
    required String email,
    required String phone,
    required String pass,
  }) async {
    try {
      Response res = await _dio.post('/api/auth/register', data: {
        "name": name,
        "email": email,
        "mobile": phone,
        "password": pass,
      });
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {}
}
