import 'package:app/controllers/category_controller.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/ui/pages/LinkAction/link_action.dart';
import 'package:app/ui/pages/category/components/LinkCard/link_card.dart';
import 'package:app/ui/pages/saveLink/save_link.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:share/share.dart';

class Category extends StatefulWidget {
  const Category({ 
      Key? key, 
      required this.category,
    }) : super(key: key);

  final CategoryModel category;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final _categoryController = CategoryController();

  List<LinkModel> links = [];
  Map<int, LinkModel> _datas = {};
  Map<int, LinkModel> selectedLink = {};

  int selectedLinkCounter = 0;
  bool _isLoading = true;
  bool _isLinkDeletionLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCategoryLinks();
  }

  @override
  void dispose() {
    super.dispose();

    links = [];
    _datas = {};
    selectedLink = {};
    _isLoading = true;
    _isLinkDeletionLoading = false;
    selectedLinkCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
          child: Scaffold(
            backgroundColor: CustomColors.white,
            body: SafeArea(
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
                          if (selectedLinkCounter == 0) {
                            shareCatagory();
                          } else {
                            null;
                          }
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          color: selectedLinkCounter == 0 
                            ? CustomColors.grey[500]!.withOpacity(0.8)
                            : CustomColors.grey[300]!,
                        ),
                      ),
                    ],
                  ),
                  ..._buildCategoryLinks(),
                ],
              ),
            ),
          ),
        ),
        selectedLinkCounter > 0 
          ? Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: Container(
              color: CustomColors.purple[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectedLinkCounter == 1 
                    ? Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: (){
                                _showSaveLinkModalBottom(context);
                              },
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: CustomColors.purple,
                              ),
                            ),
                            const Text(
                              "Editar", 
                              style: TextStyle(
                                color: CustomColors.purple,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          onDelete();
                        },
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete_outline, 
                          color: CustomColors.purple,
                        ),
                      ),
                      const Text(
                        "Excluir", 
                        style: TextStyle(
                          color: CustomColors.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          : const SizedBox(),

          _isLinkDeletionLoading
            ? Positioned(
              top: (MediaQuery.of(context).size.height * 0.6)/2,
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Excluindo links(s)...', 
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColors.grey[500],
                      )
                    ),
                    
                    const SizedBox(height: 20),
                    
                    const Center(
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: CustomColors.purple,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                ),
            )
            : const SizedBox()
      ],
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
            padding: EdgeInsets.only(
              top: 20, 
              bottom: selectedLinkCounter > 0 ? 80 : 20
            ),
            itemCount: _datas.length,
            itemBuilder: (context, index) {
              return LinkCard(
                link: _datas[links[index].id],
                isSelected: 
                selectedLink[links[index].id] != null
                  ? true : false,
                onLongPress: onLongPressCard,
                onTap: onTapCard,
                onFavorite: onFavorite,
              );
            }
          ),
        ),
      );

      return children;
    }
  }

  void onLongPressCard(int linkId) {
    final link = links.where((linkItem) => linkItem.id == linkId).toList();

    setState(() {
      selectedLink = {
        ...selectedLink,
        link[0].id: link[0],
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

  void onFavorite(int linkId, bool value) async {
    try {
      final params = {
        "id": linkId,
        "favorite": value,
      };

      await _categoryController.editLink(params);

      final link = _datas[linkId];
      link!.favorite = value;

      setState(() {
        _datas = {
          ..._datas,
          link.id: link,
        };
      });

      CustomSnackBar.show(context, 
        value 
          ? "Link adicionado aos favoritos com sucesso!" 
          : "Link removido dos favoritos com sucesso!"
      );
    } catch(error) {
      CustomSnackBar.show(context, 
        value 
          ? "Erro ao adicionar link aos favoritos! Tente novamente." 
          : "Erro ao remover link aos favoritos! Tente novamente."
      );
    }
  }

  void onConfirmDeletion() async {
    try {
      setState(() {
        _isLinkDeletionLoading = true;
      });
      for (var key in selectedLink.keys) {
        final id = selectedLink[key]!.id;

        await _categoryController.deleteLink(id); 
      }

      CustomSnackBar.show(context, "Link(s) excluído(s) com sucesso!");
    } catch(error) {
      CustomSnackBar.show(context, "Erro ao excluir link(s)! Tente novamente.");
    } finally {
      reload();
    }
  }

  void onDelete() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), 
          topRight: Radius.circular(30.0)
        ),
      ),
      backgroundColor: CustomColors.white,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
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
              LinkAction(
                save: false,
                edit: false, 
                error: false, 
                delete: true,
                onConfirm: onConfirmDeletion,
                onClose: reload,
              ),
            ],
          ),
        );
      }
    );
  }

  void fetchCategoryLinks() async {
    try {
      final response = await _categoryController.fetchLinksByCategory(widget.category.id);

      await getLinkMetadata(response);
    } catch(error) {
      CustomSnackBar.show(context, "Erro ao recuperar links! Tente novamente.");
      Navigator.pop(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> getLinkMetadata(List<LinkModel> linkList) async {
    for (var linkItem in linkList) {
      final previewData = LinkModel();

      previewData.id = linkItem.id;
      previewData.link = linkItem.link;
      previewData.favorite = linkItem.favorite;
      previewData.title = linkItem.title;

      try {
        final data = await MetadataFetch.extract(linkItem.link);
        previewData.title = data!.title ?? linkItem.title;
      } catch(error) {
        // do nothing
      } finally {
        setState(() {
          links = linkList;
          _datas = {
            ..._datas,
            linkItem.id: previewData,
          };
        });
      }
    }
  }

  void reload() {
    Navigator.pop(context);

    setState(() {
      _isLoading = true;
      links = [];
      _datas = {};
      selectedLink = {};
      _isLinkDeletionLoading = false;
      selectedLinkCounter = 0;
    });

    fetchCategoryLinks();
  }

  Future<void> shareCatagory() async {
    var linksToShare = StringBuffer();

    linksToShare.write(widget.category.title + '\n');

    for (var linkItem in links) {
      linksToShare.write(linkItem.link + '\n');
    }

    Share.share(linksToShare.toString());
  }

  void _showSaveLinkModalBottom(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    LinkModel selectedLinkItem = LinkModel();

    for (var key in selectedLink.keys) {
      selectedLinkItem = selectedLink[key]!;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), 
          topRight: Radius.circular(30.0)
        ),
      ),
      backgroundColor: CustomColors.white,
      builder: (BuildContext bc) {
        return SaveLink(
          onClose: reload,
          linkItem: selectedLinkItem, 
          category: widget.category,
        );
      }
    );
  }
}