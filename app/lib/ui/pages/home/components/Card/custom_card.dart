import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({ 
    Key? key, 
    required this.title,
    required this.isGrid,
    required this.shareOnPressed,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isGrid;
  final Future<void> Function() shareOnPressed;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: isGrid ? 137 : MediaQuery.of(context).size.width,
            height: 98,
            child: Card(
              elevation: 1,
              color: CustomColors.purple[100],
              shadowColor: CustomColors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                splashRadius: 20,
                onPressed: shareOnPressed,
                alignment: Alignment.topRight,
                icon: Icon(
                  Icons.share_outlined,
                  color: CustomColors.grey[500]!.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Positioned(
            width: isGrid ? 137 : MediaQuery.of(context).size.width/1.215, // rever
            height: 40,
            bottom: 0,
            child: Card(
              elevation: 0,
              color: CustomColors.purple[300],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8), 
                  bottomLeft: Radius.circular(8)
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.link, 
                        color: CustomColors.purple.withOpacity(0.5)
                      ),
                    ),
                    Text(
                      title, 
                      style: TextStyle(
                        color: CustomColors.purple.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}