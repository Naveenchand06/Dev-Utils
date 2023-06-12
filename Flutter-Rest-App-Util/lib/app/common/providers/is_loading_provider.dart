import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/features/authentication/repo/auth_repository.dart';

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authRepoProvider).isLoading;
});
