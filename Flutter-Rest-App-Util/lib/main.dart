import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharada_app/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;

void main() async {
  pref = await SharedPreferences.getInstance();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sharada',
      home: App(),
    );
  }
}
