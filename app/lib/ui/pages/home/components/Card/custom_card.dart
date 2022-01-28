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
            width: isGrid ? 150 : MediaQuery.of(context).size.width * 0.83,
            height: 98,
            child: Card(
              elevation: 1,
              color: CustomColors.purple[100],
              shadowColor: CustomColors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, top: 5),
              child: SizedBox(
                width: 40,
                height: 40,
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
          ),

          Positioned(
            width: isGrid ? 150 : MediaQuery.of(context).size.width * 0.83,
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
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: CustomColors.purple.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                      ),
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