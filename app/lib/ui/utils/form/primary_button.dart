import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key, 
    required this.label, 
    required this.onPressed, 
    
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              label,
              style: const TextStyle(
                color: CustomColors.white,
                fontWeight: FontWeight.w500, 
                fontSize: 16
              ),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((_) { 
              return CustomColors.purple;
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