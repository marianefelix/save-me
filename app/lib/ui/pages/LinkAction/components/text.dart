import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({ Key? key, required this.text }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 28,
        color: CustomColors.grey[500],
      ),
      textAlign: TextAlign.center
    );
  }
}