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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon, 
              size: iconSize,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight ?? FontWeight.normal
            )
          ),
        ],
      )
    );
  }
}