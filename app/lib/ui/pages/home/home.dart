import 'package:app/controllers/home_controller.dart';
import 'package:app/models/category_model.dart';
import 'package:app/stores/AppStore/app_store.dart';
import 'package:app/ui/pages/category/category.dart';
import 'package:app/ui/pages/home/components/EmptyState/empty_state.dart';
import 'package:app/ui/pages/home/components/List/list.dart';
import 'package:app/ui/pages/home/components/Title/title.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

//final appStore = AppStore();

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  final _homeController = HomeController();

  bool _isGrid = true;
  bool _isSearchEmpty = true;
  bool _isLoading = true;
  bool _categoryListIsEmpty = true;

  @override void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  void dispose() {
    super.dispose();

    clearState();
  }

  void clearState() {
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      searchController: searchController,
      searchOnChanged: searchOnChanged,
      bodyChild: Container(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildHomeChildren(context),
        ),
      ),
    );
  }

  List<Widget> _buildHomeChildren(BuildContext context) {
    List<Widget> children = [];

    if (_isLoading) {
      children.add(
        const Center(
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
        )
      );
    } else if (_categoryListIsEmpty) {
      children.add(const EmptyState());
    } else {
      children.add(const SizedBox(height: 35));
      children.add(const HomeTitle());
      children.add(
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: toggleListVisualization,
            icon: Icon(
              _isGrid 
                ? Icons.list 
                : Icons.grid_view
            ),
            color: CustomColors.grey[500],
          ),
        ),
      );
      children.add(
        CustomList(
          categories: appStore.categories,
          links: appStore.links, 
          isGrid: _isGrid,
          cardOnTap: cardOnTap,
        )
      );
    }

    return children;
  }

  void toggleListVisualization() {
    setState(() {
      _isGrid = !_isGrid;
    });
  }

  void searchOnChanged(String value) {
    setState(() {
      _isSearchEmpty = value.isEmpty;
    });
  }

  void fetchCategories() async {
    try {
      final categoriesResponse =  await _homeController.fetchCategories();
      final linksResponse = await _homeController.fetchLinks();

      appStore.setCategories([...categoriesResponse]);
      appStore.setLinks([...linksResponse]);

      setState(() {
        _categoryListIsEmpty = categoriesResponse.isEmpty;
      });
    } catch(error) {
      CustomSnackBar.show(
        context, 
        "Erro ao recuperar categorias, por favor atualize a página.",
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
          topLeft: Radius.circular(30.0), 
          topRight: Radius.circular(30.0)
        ),
      ),
      backgroundColor: CustomColors.white,
      builder: (BuildContext bc) {
        return Category(category: category);
      }
    );
  }
}