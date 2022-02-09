import 'package:app/ui/pages/category/category.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({ Key? key, required this.link }) : super(key: key);

  final PreviewData? link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: CustomColors.purple[100],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 85,
              height: 100,
              decoration: BoxDecoration(
                color: CustomColors.purple[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), 
                  bottomLeft: Radius.circular(8)
                ),
              ),
              child: Icon(
                Icons.link,
                size: 32,
                color: CustomColors.purple.withOpacity(0.5)
              ),
            )
          ),

          Positioned(
            width: 250,
            left: 85,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            link!.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: CustomColors.grey[500],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          link!.link,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: CustomColors.purple,
                            decoration: TextDecoration.underline,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){},
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          link!.favorite 
                          ? Icons.star
                          : Icons.star_outline
                        ),
                        color: link!.favorite 
                          ? CustomColors.purple[400] 
                          : CustomColors.grey[500],
                      ),
                      IconButton(
                        onPressed: (){},
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.copy
                        ),
                        iconSize: 18,
                        color: CustomColors.grey[500],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}