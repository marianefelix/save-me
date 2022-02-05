import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void show(BuildContext context, String message, {int duration = 2000}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: duration),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
      action: SnackBarAction(
        textColor: CustomColors.white,
        label: 'Fechar',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}