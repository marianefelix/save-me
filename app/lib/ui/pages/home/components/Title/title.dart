import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Categorias", 
          style: TextStyle(
            color: CustomColors.grey[500],
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )
        ),
      ],
    );
  }
}