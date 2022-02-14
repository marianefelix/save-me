import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class FavoritesTitle extends StatelessWidget {
  const FavoritesTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Favoritos",
            style: TextStyle(
              color: CustomColors.grey[500],
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
