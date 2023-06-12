import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/features/authentication/models/app_user.dart';
import 'package:sharada_app/app/features/authentication/models/auth_response.dart';
import 'package:sharada_app/app/features/authentication/models/auth_result.dart';
import 'package:sharada_app/app/features/authentication/models/auth_state.dart';
import 'package:sharada_app/app/features/authentication/network/authenticator.dart';
import 'package:sharada_app/main.dart';
import 'package:sharada_app/utils/storage/storage_strings.dart';

final authRepoProvider =
    StateNotifierProvider<UserRepository, AuthState>((ref) {
  return UserRepository(ref);
});

class UserRepository extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();

  UserRepository(this.ref) : super(const AuthState.unknown()) {
    if (pref.getBool(StorageStr.isLoggedIn) ?? false) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        user: AppUser(
          id: pref.getString(StorageStr.id) ?? '',
          name: pref.getString(StorageStr.name) ?? '',
          email: pref.getString(StorageStr.email) ?? '',
          isSuperUser: pref.getBool(StorageStr.isSuperUser) ?? false,
          original: pref.getBool(StorageStr.isOriginal) ?? false,
        ),
      );
    }
  }

  final Ref ref;

  Future<bool> login({
    required String email,
    required String pass,
  }) async {
    try {
      state = state.copiedWithIsLoading(true);
      Response res = await _authenticator.login(email: email, pass: pass);
      AuthResponse authRes = AuthResponse.fromJson(res.data);
      await saveUser(authRes);
      state = AuthState(
          result: AuthResult.success,
          isLoading: false,
          user: authRes.getAppUser());

      return true;
    } on DioError catch (e) {
      state = state.copiedWithIsLoading(false);
      debugPrint('The ERROR  IS $e');
      debugPrint('The ERROR Res IS ${e.response}');
      debugPrint('The ERROR DATA IS ${e.response?.data}');
      debugPrint('The ERROR Status IS ${e.response?.statusCode}');
      return false;
    } catch (e) {
      state = state.copiedWithIsLoading(false);
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String pass,
  }) async {
    try {
      Response res = await _authenticator.register(
          name: name, email: email, phone: phone, pass: pass);
      AuthResponse authRes = AuthResponse.fromJson(res.data);
      await saveUser(authRes);
      state = AuthState(
          result: AuthResult.success,
          isLoading: false,
          user: authRes.getAppUser());
      return true;
    } catch (e) {
      state = state.copiedWithIsLoading(false);
      return false;
    }
  }

  Future<void> logout() async {
    state = const AuthState.unknown();
    pref.clear();
  }

  Future<void> saveUser(AuthResponse res) async {
    await pref.setBool(StorageStr.isLoggedIn, true);
    await pref.setString(StorageStr.id, res.data?.user.id ?? '');
    await pref.setString(StorageStr.name, res.data?.user.name ?? '');
    await pref.setString(StorageStr.email, res.data?.user.email ?? '');
    await pref.setString(StorageStr.token, res.data?.token ?? '');
    await pref.setBool(StorageStr.isOriginal, res.data?.user.original ?? false);
    await pref.setBool(
        StorageStr.isSuperUser, res.data?.user.isSuperUser ?? false);
  }
}
