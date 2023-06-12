import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/features/authentication/models/auth_result.dart';
import 'package:sharada_app/app/features/authentication/repo/auth_repository.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authRepoProvider);
  return authState.result == AuthResult.success;
});
