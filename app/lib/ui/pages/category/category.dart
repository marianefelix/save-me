import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/ui/pages/category/components/LinkCard/link_card.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:share/share.dart';

class Category extends StatefulWidget {
  const Category({ 
      Key? key, 
      required this.links, 
      required this.category,
    }) : super(key: key);

  final List<LinkModel> links;
  final CategoryModel category;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Map<int, LinkModel> _datas = {};
  Map<int, LinkModel> selectedLink = {};
  int selectedLinkCounter = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLinkMetadata();
  }

  @override
  void dispose() {
    super.dispose();

    _datas = {};
    selectedLink = {};
    _isLoading = true;
    selectedLinkCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  Icons.close, 
                  color: Colors.grey[500],
                  size: 25
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.category.title,
                  style: TextStyle(
                    color: CustomColors.grey[500],
                    fontSize: 25, 
                    fontWeight: FontWeight.w500
                  )
                ),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    shareCatagory();
                  },
                  icon: Icon(
                    Icons.share_outlined,
                    color: CustomColors.grey[500]!.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            ..._buildCategoryLinks(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryLinks() {
    if (_isLoading) {
      return [
        const SizedBox(height: 40,),
        const Center(
          child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: CustomColors.purple,
                ),
              ),
            ),
        ),
      ];
    } else {
      List<Widget> children = [];
      if (selectedLinkCounter > 0) {
        children.add(const SizedBox(height: 15,));
        children.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: CustomColors.purple[200],
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                ),
                child: Center(
                  child: Text(
                    selectedLinkCounter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: CustomColors.purple,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Text(
                selectedLinkCounter > 1
                ? "selecionados"
                : "selecionado",
                style: TextStyle(
                  color: CustomColors.grey[500]
                ),
              )
            ],
          ),
        );
      }
  
      children.add(
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            itemCount: widget.links.length,
            itemBuilder: (context, index) {
              return LinkCard(
                link: _datas[widget.links[index].id],
                isSelected: 
                selectedLink[widget.links[index].id] != null 
                  ? true : false,
                onLongPress: onLongPressCard,
                onTap: onTapCard,
              );
            }
          ),
        ),
      );

      return children;
    }
  }

  void onLongPressCard(int linkId) {
    final link = _datas[linkId];

    setState(() {
      selectedLink = {
        ...selectedLink,
        link!.id: link,
      };
      selectedLinkCounter = selectedLink.length;
    });
  }

  void onTapCard(int linkId) {
    final newSelectedLink = {
      ...selectedLink
    };

    newSelectedLink.remove(linkId);

    setState(() {
      selectedLink = newSelectedLink;
      selectedLinkCounter = selectedLink.length;
    });
  }

  void getLinkMetadata() async {
    try {
      for (var linkItem in widget.links) {
        final data = await MetadataFetch.extract(linkItem.link);

        final previewData = LinkModel();
        previewData.id = linkItem.id;
        previewData.title = data?.title ?? linkItem.title;
        previewData.link = linkItem.link;
        previewData.favorite = linkItem.favorite;

        setState(() {
          _datas = {
            ..._datas,
            linkItem.id: previewData,
          };
        });
      }
    } catch(error) {
      CustomSnackBar.show(context, "Erro ao recuperar links! Tente novamente.");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> shareCatagory() async {
    var linksToShare = StringBuffer();

    linksToShare.write(widget.category.title + '\n');

    for (var linkItem in widget.links) {
      linksToShare.write(linkItem.link + '\n');
    }

    Share.share(linksToShare.toString());
  }
}