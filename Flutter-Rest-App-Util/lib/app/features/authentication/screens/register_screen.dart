import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharada_app/app/common/dialogs/alert_dialog_model.dart';
import 'package:sharada_app/app/common/dialogs/login_failure_dialog.dart';
import 'package:sharada_app/app/features/authentication/repo/auth_repository.dart';
import 'package:sharada_app/utils/constants/global.dart';
import 'package:sharada_app/app/common/components/widgets/common_button.dart';
import 'package:sharada_app/app/common/components/widgets/common_text_field.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({
    super.key,
    required this.toggleView,
  });

  final Function toggleView;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
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
                      'Register',
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
                  hintText: 'Username',
                  fieldController: _nameController,
                ),
                CommonTextField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  fieldController: _emailController,
                ),
                CommonTextField(
                  hintText: 'Enter your mobile number',
                  keyboardType: TextInputType.number,
                  fieldController: _mobileController,
                  length: 10,
                ),
                CommonTextField(
                  hintText: 'Enter your password',
                  fieldController: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 30.0),
                CommonButton(
                  buttonTitle: 'Submit',
                  onPress: () async {
                    bool res =
                        await ref.read(authRepoProvider.notifier).register(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _mobileController.text.trim(),
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
                      'Already a member?',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () => toggleView(),
                      child: const Text(
                        'Login now!',
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
