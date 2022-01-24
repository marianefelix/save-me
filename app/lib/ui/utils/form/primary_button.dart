import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key, 
    required this.label, 
    required this.onPressed, 
    this.width,
    this.verticalPadding, 
    this.backgroundColor, 
    this.textColor
  }) : super(key: key);

  final String label;
  final double? width;
  final void Function()? onPressed;
  final double? verticalPadding;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 18.0),
            child: Text(
              label,
              style: TextStyle(
                color: textColor ?? CustomColors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16
              ),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((_) { 
              return backgroundColor ?? CustomColors.purple;
            }),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              );
            }),
          ),
        ),
      )
    );
  }
}