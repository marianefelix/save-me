import 'package:app/ui/pages/home/components/Card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CustomList extends StatelessWidget {
  const CustomList({ 
    Key? key, 
    required this.categories,
    required this.links,
    required this.isGrid,
  }) : super(key: key);

  final Map<int, String> categories;
  final List<Object> links;
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
          final id = index + 1;
          final categorieItem = categories[id]!;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCard(isGrid: isGrid, title: categorieItem, shareOnPressed: shareCatagory),
            ],
          );
        }
      )
      :
        ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
          final id = index + 1;
          final categorieItem = categories[id]!;

          return CustomCard(isGrid: isGrid, title: categorieItem, shareOnPressed: shareCatagory);
          }
        )
    );
  }

  Future<void> shareCatagory() async {
    Share.share("teste");
  }
}