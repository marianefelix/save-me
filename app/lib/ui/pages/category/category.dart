import 'package:app/models/link_model.dart';
import 'package:app/ui/pages/category/components/LinkCard/link_card.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';


class PreviewData {
  String title = "";
  String link = "";
  bool favorite = false;
}

class Category extends StatefulWidget {
  const Category({ 
      Key? key, 
      required this.links, 
      required this.categoryTitle,
    }) : super(key: key);

  final List<LinkModel> links;
  final String categoryTitle;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Map<String, PreviewData> _datas = {};
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
    _isLoading = true;
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
                  widget.categoryTitle,
                  style: TextStyle(
                    color: CustomColors.grey[500],
                    fontSize: 25, 
                    fontWeight: FontWeight.w500
                  )
                ),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
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
      return [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            itemCount: widget.links.length,
            itemBuilder: (context, index) {
              return LinkCard(link: _datas[widget.links[index].link]);
            }
          ),
        )
      ];
    }
  }

  void getLinkMetadata() async {
    try {
      for (var linkItem in widget.links) {
        final data = await MetadataFetch.extract(linkItem.link);

        final previewData = PreviewData();
        previewData.title = data?.title ?? linkItem.title;
        previewData.link = linkItem.link;
        previewData.favorite = linkItem.favorite;

        setState(() {
          _datas = {
            ..._datas,
            linkItem.link: previewData,
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
}