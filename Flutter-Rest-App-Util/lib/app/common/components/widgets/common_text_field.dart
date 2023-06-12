import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharada_app/utils/constants/global.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    required this.hintText,
    this.onChange,
    this.onSubmit,
    this.fieldController,
    this.length = 256,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.fieldAction = TextInputAction.next,
    this.validate,
  });

  final String hintText;
  final bool isPassword;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextInputType keyboardType;
  final TextEditingController? fieldController;
  final TextInputAction fieldAction;
  final int length;
  final String? Function(String?)? validate;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool showPassword = true;

  void _passwordVisbilityFunction() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType,
      textInputAction: widget.fieldAction,
      obscureText: widget.isPassword ? showPassword : false,
      maxLength: widget.length,
      validator: widget.validate,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14.0,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _passwordVisbilityFunction,
                icon: showPassword
                    ? const Icon(
                        Icons.visibility,
                      )
                    : const Icon(
                        Icons.visibility_off,
                      ),
              )
            : null,
        contentPadding: const EdgeInsets.all(18.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2.0,
            strokeAlign: 10.0,
            color: appGreenColor,
          ),
        ),
      ),
    );
  }
}
