import 'package:flutter/foundation.dart';
import 'package:sharada_app/app/features/authentication/models/app_user.dart';
import 'package:sharada_app/app/features/authentication/models/auth_result.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final AppUser? user;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.user,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        user = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        user: user,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          user == other.user);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        user,
      );
}
