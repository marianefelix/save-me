import 'package:flutter/material.dart';

import 'package:app/ui/utils/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key, 
    required this.controller, 
    required this.icon,
    required this.isEmpty, 
    required this.hasError, 
    this.labelText, 
    this.inputType, 
    this.hintText,
    this.contentPadding,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final TextInputType? inputType;
  final String? labelText;
  final String? hintText;
  final bool isEmpty;
  final void Function(String)? onChanged;
  final bool hasError;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return (
      TextFormField(
        controller: controller,
        keyboardType: inputType,
        onChanged: onChanged,
        cursorColor: CustomColors.purple,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: contentPadding,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: hasError
                ? Colors.red 
                : isEmpty
                ? CustomColors.grey[200]!  
                : CustomColors.purple
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: CustomColors.grey[300]
          ),
        ),
      )
    );
  }
}