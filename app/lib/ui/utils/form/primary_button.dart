import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key, 
    required this.label, 
    required this.onPressed,
    required this.isLoading,
    this.width,
    this.verticalPadding, 
    this.backgroundColor, 
    this.textColor, 
    this.elevation, 
  }) : super(key: key);

  final String label;
  final bool isLoading;
  final double? width;
  final void Function()? onPressed;
  final double? verticalPadding;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading 
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: CustomColors.purple,
                      ),
                    )
                  : const SizedBox(),
                Padding(
                  padding: EdgeInsets.only(left: isLoading ? 20 : 0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: isLoading 
                        ? CustomColors.grey[300]
                        : textColor ?? CustomColors.white,
                      fontWeight: FontWeight.w500, 
                      fontSize: 16
                    ),
                  ),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((_) {
              if (isLoading) {
                return CustomColors.grey[100];
              }

              if (backgroundColor != null) {
                return backgroundColor;
              }

              return CustomColors.purple;
            }),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              );
            }),
            elevation: MaterialStateProperty.resolveWith<double?>((_) {
              if (elevation != null) {
                return elevation;
              }
            })
          ),
        ),
      )
    );
  }
}