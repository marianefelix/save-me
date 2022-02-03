import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({ 
    Key? key, 
    required this.backgroundColor, 
    required this.color, 
    required this.label, 
    required this.fontSize, 
    required this.iconSize, 
    required this.icon, 
    required this.padding,
    this.onPressed,
    this.fontWeight,
    this.isLoading, 
  }) : super(key: key);


  final Color? backgroundColor;
  final Color? color;
  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  final double iconSize;
  final IconData icon;
  final EdgeInsetsGeometry padding;
  final Function()? onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading != null && isLoading!) ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((_) { 
          return backgroundColor;
        }),
        padding: MaterialStateProperty.resolveWith((_) { 
          return padding;
        }),
        elevation: MaterialStateProperty.resolveWith((_) { 
          return 0;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      child: Row(
        children: [
          isLoading != null && isLoading!
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: CustomColors.purple,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  icon, 
                  size: iconSize,
                  color: color,
                ),
              ),
              
          Padding(
            padding: EdgeInsets.only(left: (isLoading != null && isLoading!) ? 10 : 0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: (isLoading != null && isLoading!)
                  ? CustomColors.grey[300]
                  : color ?? CustomColors.grey[500],
                fontWeight: fontWeight ?? FontWeight.normal
              )
            ),
          ),
        ],
      )
    );
  }
}