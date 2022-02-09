import 'package:app/models/link_model.dart';
import 'package:app/ui/pages/category/category.dart';
import 'package:app/ui/pages/category/components/LinkCard/link_card.dart';
import 'package:flutter/material.dart';

class LinkList extends StatelessWidget {
  const LinkList({ 
      Key? key, 
      required this.links, 
      required this.datas,
    }) : super(key: key);

  final List<LinkModel> links;
  final Map<String, PreviewData> datas;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemCount: links.length,
        itemBuilder: (context, index) {
          return LinkCard(link: datas[links[index].link]);
        }
      )
    );
  }
}