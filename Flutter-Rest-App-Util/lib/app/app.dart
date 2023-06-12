import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/common/loading/loading_screen.dart';
import 'package:sharada_app/app/common/providers/is_loading_provider.dart';
import 'package:sharada_app/app/common/providers/is_loggedin_provider.dart';
import 'package:sharada_app/app/features/authentication/screens/auth_wrapper.dart';
import 'package:sharada_app/app/features/home/home.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(
      isLoadingProvider,
      (previous, isLoading) {
        if (isLoading == true) {
          LoadingScreen.instance().show(
            context: context,
          );
        } else {
          LoadingScreen.instance().hide();
        }
      },
    );
    final isLoggedIn = ref.watch(isLoggedInProvider);
    return SafeArea(
      child: isLoggedIn ? const Home() : const AuthWrapper(),
    );
  }
}
