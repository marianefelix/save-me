import 'package:app/ui/pages/home/components/Card/custom_card.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({ 
    Key? key, 
    required this.categories,
    required this.isGrid,
  }) : super(key: key);

  final List<String> categories;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: isGrid 
      ? GridView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          mainAxisExtent: 100,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final categorieItem = categories[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCard(isGrid: isGrid, title: categorieItem,),
            ],
          );
        }
      )
      :
        ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final categorieItem = categories[index];
            return CustomCard(isGrid: isGrid, title: categorieItem);
          }
        )
    );
  }
}