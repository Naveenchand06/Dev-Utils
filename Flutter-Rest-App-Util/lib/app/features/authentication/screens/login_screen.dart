import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharada_app/app/common/dialogs/alert_dialog_model.dart';
import 'package:sharada_app/app/common/dialogs/login_failure_dialog.dart';
import 'package:sharada_app/app/features/authentication/repo/auth_repository.dart';
import 'package:sharada_app/utils/constants/global.dart';
import 'package:sharada_app/app/common/components/widgets/common_button.dart';
import 'package:sharada_app/app/common/components/widgets/common_text_field.dart';
import 'package:sharada_app/utils/validator.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({
    super.key,
    required this.toggleView,
  });

  final Function toggleView;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: whiteColor,
                  child: Text(
                    'Sharada',
                    style: GoogleFonts.caveat(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w600,
                      color: appGreenColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                          color: appGreenColor,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                CommonTextField(
                  hintText: 'Enter your email',
                  fieldController: _emailController,
                ),
                // const SizedBox(height: 10.0),
                CommonTextField(
                  hintText: 'Enter your password',
                  fieldController: _passwordController,
                  isPassword: true,
                  validate: (val) => Validator('Password', val).required(),
                ),
                const SizedBox(height: 30.0),
                CommonButton(
                  buttonTitle: 'Submit',
                  onPress: () async {
                    bool res = await ref.read(authRepoProvider.notifier).login(
                          email: _emailController.text.trim(),
                          pass: _passwordController.text.trim(),
                        );
                    if (!res) {
                      await showLoginFailureDialog(context);
                    }
                  },
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () => toggleView(),
                      child: const Text(
                        'Register now!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: appGreenColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showLoginFailureDialog(BuildContext context) async {
    await const LoginFailureDialog().present(context).then((value) => null);
  }
}
