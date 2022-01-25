import 'package:app/models/category.dart';
import 'package:app/models/link.dart';
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

  final List<Category> categories;
  final List<Link> links;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          final categoryItem = categories[index];

          final categoryLinks = links.where((linkItem) => 
            linkItem.categoryId == categoryItem.id
          ).toList();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCard(
                isGrid: isGrid, 
                title: categoryItem.title,
                onTap: onTap,
                shareOnPressed: () async {
                  shareCatagory(categoryItem.title, categoryLinks);
                }
              ),
            ],
          );
        }
      )
      :
        ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final categoryItem = categories[index];

            final categoryLinks = links.where((linkItem) => 
              linkItem.categoryId == categoryItem.id
            ).toList();

            return CustomCard(
              isGrid: isGrid, 
              title: categoryItem.title,
              onTap: onTap,
              shareOnPressed: () async {
                shareCatagory(categoryItem.title, categoryLinks);
              }
            );
          }
        )
    );
  }

  Future<void> shareCatagory(String categoryTitle, List<Link> categoryLinks,) async {
    var linksToShare = StringBuffer();

    linksToShare.write(categoryTitle + '\n');

    for (var linkItem in categoryLinks) {
      linksToShare.write(linkItem.link + '\n');
    }

    Share.share(linksToShare.toString());
  }

  void onTap() {}
}