import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/features/authentication/repo/auth_repository.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Hello Universe!'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(authRepoProvider.notifier).logout();
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
