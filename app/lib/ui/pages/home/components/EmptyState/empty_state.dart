import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({ 
    Key? key, 
    required this.message, 
    required this.imgName, 
    this.subtitle 
  }) : super(key: key);

  final String message;
  final String? subtitle;
  final String imgName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.grey[400],
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          subtitle != null 
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CustomColors.grey[200],
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
            : const SizedBox(),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/$imgName.svg',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}