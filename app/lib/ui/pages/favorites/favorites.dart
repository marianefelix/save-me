import 'package:app/controllers/favorites_controller.dart';
import 'package:app/models/category_model.dart';
import 'package:app/stores/AppStore/app_store.dart';
import 'package:app/ui/pages/category/category.dart';
import 'package:app/ui/pages/favorites/components/Title/title.dart';
import 'package:app/ui/pages/home/components/EmptyState/empty_state.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../controllers/category_controller.dart';
import '../../../models/link_model.dart';
import '../category/components/LinkCard/link_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  TextEditingController searchController = TextEditingController();
  final _favoritesController = FavoritesController();
  final _categoryController = CategoryController();

  // bool _isGrid = true;
  bool _isSearchEmpty = true;
  bool _isLoading = true;
  bool _favoriteLinkListIsEmpty = true;
  Map<int, LinkModel> _datas = {};

  List<CategoryModel> _searchCategoryResult = [];

  @override
  void initState() {
    super.initState();
    fetchFavotires();
  }

  @override
  void dispose() {
    super.dispose();

    clearState();
  }

  void clearState() {
    searchController = TextEditingController();

    // _isGrid = true;
    _isSearchEmpty = true;
    _isLoading = true;
    _favoriteLinkListIsEmpty = true;

    _searchCategoryResult = [];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      searchController: searchController,
      searchOnChanged: searchOnChanged,
      bodyChild: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          height: MediaQuery.of(context).size.height,
          child: !_isSearchEmpty && _searchCategoryResult.isEmpty
              ? const EmptyState(
                  message: "Nenhuma link encontrado.",
                  subtitle: "Tente pesquisar por outros valores.",
                  imgName: "not-found",
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildFavoriteChildren(context),
                )),
    );
  }

  List<Widget> _buildFavoriteChildren(BuildContext context) {
    List<Widget> children = [];

    if (_isLoading) {
      children.add(const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: CustomColors.purple,
            ),
          ),
        ),
      ));
    } else if (_favoriteLinkListIsEmpty) {
      children.add(const EmptyState(
        message: "Você ainda não favoritou nenhum link.",
        imgName: "empty_state",
      ));
    } else {
      children.add(const SizedBox(height: 35));
      children.add(const FavoritesTitle());
      children.add(ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemCount: appStore.favoritelinks.length,
          itemBuilder: (context, index) {
            return LinkCard(
              link: appStore.favoritelinks[index],
              isSelected: false,
              onFavorite: onFavorite,
            );
          }));
      // children.add(
      //   Align(
      //     alignment: Alignment.topRight,
      //     child: IconButton(
      //       onPressed: toggleListVisualization,
      //       icon: Icon(_isGrid ? Icons.list : Icons.grid_view),
      //       color: CustomColors.grey[500],
      //     ),
      //   ),
      // );

    }

    return children;
  }

  // void toggleListVisualization() {
  //   setState(() {
  //     _isGrid = !_isGrid;
  //   });
  // }

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

      CustomSnackBar.show(
          context,
          value
              ? "Link adicionado aos favoritos com sucesso!"
              : "Link removido dos favoritos com sucesso!");
    } catch (error) {
      CustomSnackBar.show(
          context,
          value
              ? "Erro ao adicionar link aos favoritos! Tente novamente."
              : "Erro ao remover link aos favoritos! Tente novamente.");
    }
  }

  void fetchFavotires() async {
    try {
      final linksResponse = await _favoritesController.fetchLinks();

      appStore.setFavoriteLinks([...linksResponse]);

      setState(() {
        _favoriteLinkListIsEmpty = linksResponse.isEmpty;
      });
    } catch (error) {
      CustomSnackBar.show(
        context,
        "Erro ao recuperar links favoritos, por favor atualize a página.",
        duration: 3000,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void cardOnTap(BuildContext context, CategoryModel category) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        backgroundColor: CustomColors.white,
        builder: (BuildContext bc) {
          return Category(category: category);
        });
  }

  void searchOnChanged(String value) {
    setState(() {
      _isSearchEmpty = value.isEmpty;
    });

    final newList = appStore.categories.where((category) {
      final lowerCaseTitle = category.title.toLowerCase();
      final lowerCaseValue = value.toLowerCase();

      if (lowerCaseTitle.contains(lowerCaseValue)) {
        return true;
      }

      return false;
    }).toList();

    setState(() {
      _searchCategoryResult = newList;
    });
  }
}
