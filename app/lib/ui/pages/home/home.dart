import 'package:app/model/category.dart';
import 'package:app/model/link.dart';
import 'package:app/ui/pages/home/components/List/list.dart';
import 'package:app/ui/pages/home/components/SortRow/sort_row.dart';
import 'package:app/ui/pages/home/components/Title/title.dart';
import 'package:app/ui/utils/ElevatedButton/elevated_button.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  List<Category> categoryList = [];
  List<Link> linkList = [];

  bool isGrid = true;
  String selectedSortOption = 'date';

  @override void initState() {
    super.initState();

    generateLinks();
    generateCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      searchController: searchController,
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

            CustomList(categories: categoryList, links: linkList, isGrid: isGrid),
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

  void handleSortOptionSelected(String orderOption) {
    setState(() {
      selectedSortOption = orderOption;
    });

    Navigator.pop(context);
  }

  void generateLinks() {
    final linkJson = [
      {
        "id": 1,
        "link": "https://teste.com",
        "favorite": false,
        "user_id": 1,
        "category_id": 1
      },
      {
        "id": 2,
        "link": "https://teste2.com",
        "favorite": false,
        "user_id": 1,
        "category_id": 1
      },
      {
        "id": 3,
        "link": "https://teste3.com",
        "favorite": false,
        "user_id": 1,
        "category_id": 2
      },
    ];

    for (var json in linkJson) {
      final Link link = Link.fromJson(json);

      linkList.add(link);
    }
  }

  void generateCategories() {
    final categoryJson = [
      {
        "id": 1,
        "title": 'Design',
      },
      {
        "id": 2,
        "title": 'Inspirações',
      },
      {
        "id": 3,
        "title": 'Teste Categoria 1',
      },
      {
        "id": 4,
        "title": 'Teste Categoria 2',
      },
      {
        "id": 5,
        "title": 'Teste Categoria 3',
      },
    ];

    for (var json in categoryJson) {
      final Category category = Category.fromJson(json);

      categoryList.add(category);
    }
  }
}