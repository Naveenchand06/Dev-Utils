import 'package:flutter/material.dart';
import 'package:sharada_app/app/features/authentication/screens/login_screen.dart';
import 'package:sharada_app/app/features/authentication/screens/register_screen.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _showSignin = true;

  void _toggleView() {
    setState(() => _showSignin = !_showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignin) {
      return LoginScreen(toggleView: _toggleView);
    } else {
      return RegisterScreen(toggleView: _toggleView);
    }
  }
}
