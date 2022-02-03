import 'package:app/controllers/home_controller.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/stores/HomeStore/home_store.dart';
import 'package:app/ui/pages/home/components/List/list.dart';
import 'package:app/ui/pages/home/components/SortRow/sort_row.dart';
import 'package:app/ui/pages/home/components/Title/title.dart';
import 'package:app/ui/utils/ElevatedButton/elevated_button.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final homeStore = HomeStore();

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  List<LinkModel> linkList = [];
  final _homeController = HomeController();

  bool isGrid = true;
  bool isSearchEmpty = true;
  String selectedSortOption = 'date';

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
          children: [
            const SizedBox(height: 35),

            const HomeTitle(),

            SortRow(
              sortOnPressed: () { 
                showOptions(context);
              },
              selectedSortOption: selectedSortOption,
              toggleListVisualization: toggleListVisualization,
              isGrid: isGrid,
            ),

            // rever
            Observer(
              builder: (_) => CustomList(
                categories: homeStore.categories, 
                links: homeStore.links, 
                isGrid: isGrid
              )
            ),
            //EmptyState()
          ],
        ),
      ),
    );
  }

  void toggleListVisualization() {
    setState(() {
      isGrid = !isGrid;
    });
  }

  void showOptions(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), 
          topRight: Radius.circular(30.0)
        ),
      ),
      backgroundColor: CustomColors.white,
      builder: (context) {
        return BottomSheet(
          onClosing: (){},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), 
              topRight: Radius.circular(30.0)
            ),
          ),
          backgroundColor: CustomColors.white,
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 15),
                    child: Row(
                      children: [
                        Text(
                          "Ordenar por",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.grey[500]
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: (){
                      handleSortOptionSelected("date");
                    },
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                    label: "Data de criação",
                    fontSize: 14,
                    icon: Icons.calendar_today,
                    iconSize: 18,
                    color: selectedSortOption == 'date' 
                      ? CustomColors.purple
                      : CustomColors.grey[500],
                    backgroundColor: selectedSortOption == 'date' 
                      ? CustomColors.purple[50]
                      : CustomColors.white,
                  ),
          
                  CustomElevatedButton(
                    onPressed: (){
                      handleSortOptionSelected("alpha");
                    },
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                    label: "Ordem alfabética",
                    fontSize: 14,
                    icon: Icons.sort_by_alpha_outlined,
                    iconSize: 18,
                    color: selectedSortOption == 'alpha' 
                      ? CustomColors.purple
                      : CustomColors.grey[500],
                    backgroundColor: selectedSortOption == 'alpha' 
                      ? CustomColors.purple[50]
                      : CustomColors.white,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void searchOnChanged(String value) {
    setState(() {
      isSearchEmpty = value.isEmpty;
    });
  }

  void handleSortOptionSelected(String orderOption) {
    setState(() {
      selectedSortOption = orderOption;
    });

    Navigator.pop(context);
  }

  void fetchCategories() async {
    try {
      final categoriesResponse =  await _homeController.fetchCategories();
      final linksResponse = await _homeController.fetchLinks();

      homeStore.setCategories(categoriesResponse);
      homeStore.setLinks(linksResponse);
    } catch(error) {
      CustomSnackBar.show(
        context, 
        "Erro ao recuperar categorias, por favor atualize a página.",
        duration: 3000,
      );
    }
  }
}