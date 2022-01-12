import 'package:flutter/material.dart';

import 'package:app/ui/utils/custom_colors.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key, 
    required this.controller, 
    required this.isEmpty, 
    required this.obscureText, 
    required this.hasFocus, 
    required this.suffixIconOnTap,
    required this.isPasswordHidden,
    this.focusNode,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final bool isEmpty;
  final bool hasFocus;
  final bool isPasswordHidden;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function() suffixIconOnTap;

  @override
  Widget build(BuildContext context) {
    return (
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        onTap: onTap,
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: CustomColors.purple,
        decoration: InputDecoration(
          labelText: "Senha",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: isEmpty
                ? CustomColors.grey[200]! 
                : CustomColors.purple
            ),
          ), 
          prefixIcon: Icon(
            Icons.lock_outline, 
            color: CustomColors.grey[300]
          ),
          suffixIcon: hasFocus && !isEmpty
            ? GestureDetector(
              onTap: suffixIconOnTap,
              child: Icon(
                isPasswordHidden
                ? Icons.visibility
                : Icons.visibility_off,
                color: CustomColors.grey[300]
              ),
            )
          : null
        ),
      )
    );
  }
}