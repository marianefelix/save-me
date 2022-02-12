import 'package:app/controllers/save_link_controller.dart';
import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/ui/pages/LinkAction/link_action.dart';
import 'package:app/ui/pages/home/home.dart';
import 'package:app/ui/pages/saveLink/components/category_field.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/Form/text_field.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class SaveLink extends StatefulWidget {
  const SaveLink({
    Key? key, 
    this.onClose,
    this.linkItem, 
    this.category, 
  }) : super(key: key);

  final LinkModel? linkItem;
  final CategoryModel? category;
  final void Function()? onClose;

  @override
  _SaveLinkState createState() => _SaveLinkState();
}

class _SaveLinkState extends State<SaveLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  bool _isTitleEmpty = true;
  bool _isLinkEmpty = true;
  bool _isCategoryEmpty = true;

  bool _isLoading = false;
  bool _isCreateCategoryLoading = false;
  bool _isFetchCategoriesLoading = true;
  bool _showSucessMessage = false;
  bool _showErrorMessage = false;

  List<CategoryModel> categoryList = [];
  List<CategoryModel> searchCategoryResult = [];

  CategoryModel selectedCategory = CategoryModel();
  
  final _saveLinkController = SaveLinkController();

  @override
  void initState() {
    super.initState();
    fetchCategories();

    if (widget.linkItem != null && widget.category != null) {
      LinkModel link = widget.linkItem!;
      titleController.text = link.title;
      linkController.text = link.link;
      selectedCategory = widget.category!;

      if (link.title != "") {
        _isTitleEmpty = false;
      }

      _isLinkEmpty = false;
    }
  }

  @override
  void dispose() {
    super.dispose();

    titleController = TextEditingController();
    linkController = TextEditingController();
    categoryController = TextEditingController();

    _isTitleEmpty = true;
    _isLinkEmpty = true;
    _isCategoryEmpty = true;

    _isLoading = false;
    _isCreateCategoryLoading = false;
    selectedCategory = CategoryModel();


    _showSucessMessage = false;
    _showErrorMessage = false;

    categoryList = [];
    searchCategoryResult = [];
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
                 saveLinkOnClose();
                },
              ),
            ),
            ..._buildSaveLink(),
          ],
        ),
      ),
    );
  }

  void saveLinkOnClose() {
    if (widget.linkItem != null && widget.onClose != null) {
      widget.onClose!();
    } else {
      Navigator.pushReplacement(context, 
        MaterialPageRoute(
          builder: (context) => const Home()
        )
      );
    }
  }

  List<Widget> _buildSaveLink() {
    if (_showSucessMessage) {
      return [
        LinkAction(
          edit: widget.linkItem != null, 
          save: widget.linkItem == null,
          error: false, 
          delete: false,
          onClose: saveLinkOnClose,
        )
      ];
    } else if (_showErrorMessage) {
      return [
        LinkAction(
          edit: false,
          save: false, 
          error: true, 
          delete: false, 
          onBack: onBack
        )
      ];
    } else {
      List<Widget> children = [
        Row(
          children: <Widget>[
            Text(
              widget.linkItem != null
                ? 'Editar link'
                : 'Salvar link', 
              style: TextStyle(
                color: CustomColors.grey[500],
                fontSize: 25, 
                fontWeight: FontWeight.w500
              )
            ),
          ],
        ),

        const SizedBox(height: 30),

        Text(
          "Título", 
          style: TextStyle(
          color: CustomColors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.w500,
          )
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 50,
          child: CustomTextField(
            controller: titleController,
            contentPadding: EdgeInsets.zero,
            icon: Icons.title_outlined,
            labelText: "Digite o titulo",
            isEmpty: _isTitleEmpty,
            hasError: false,
            onChanged: (value) {
              setState(() {
                _isTitleEmpty = value.isEmpty;
              });
            },
          )
        ),

        const SizedBox(height: 15),
        
        Text(
          "Link", 
          style: TextStyle(
          color: CustomColors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.w500,
          )
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 50,
          child: CustomTextField(
            controller: linkController,
            icon: Icons.link_outlined,
            contentPadding: EdgeInsets.zero,
            labelText: "http://link@example.com",
            isEmpty: _isLinkEmpty,
            hasError: false,
            onChanged: (value) {
              setState(() {
                _isLinkEmpty = value.isEmpty;
              });
            }
          )
        ),

        const SizedBox(height: 15),

        Text(
          "Categoria", 
          style: TextStyle(
            color: CustomColors.grey[500],
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )
        ),

        const SizedBox(height: 8),

        selectedCategory.id != 0 
          ? Chip(
              backgroundColor: CustomColors.purple,
              padding: const EdgeInsets.all(5),
              deleteIcon: const Icon(
                Icons.close, 
                color: CustomColors.white,
                size: 15,
              ),
              onDeleted: deleteSelectedCategory,
              label: Text(
              selectedCategory.title,
              style: const 
                TextStyle(
                  color: CustomColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          : CategoryField(
              controller: categoryController,
              isEmpty: _isCategoryEmpty,
              hasError: false,
              categories: searchCategoryResult,
              onChanged: categoryFieldOnChanged,
              categoryChipOnSelect: categoryChipOnSelect,
              createCategoryOnPressed: createCategoryOnPressed,
              isCreateCategoryLoading: _isCreateCategoryLoading,
              isFetchCategoriesLoading: _isFetchCategoriesLoading,
            ),
        
        const SizedBox(height: 50),

        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: PrimaryButton(
                isLoading: _isLoading,
                label: "Confirmar",
                backgroundColor: _isLinkEmpty || selectedCategory.id == 0 
                  ? CustomColors.grey[100] 
                  : CustomColors.purple,
                textColor: _isLinkEmpty || selectedCategory.id == 0  
                  ? CustomColors.grey[300] 
                  : CustomColors.white,
                width: MediaQuery.of(context).size.width * 0.40,
                verticalPadding: 13.0,
                onPressed: _isLinkEmpty || selectedCategory.id == 0 
                  ? null 
                  : confirmOnPressed,
              ),
            ),
          ),
        ),
      ];

      return [...children];
    }
  }

  void fetchCategories() async {
    try {    
      final categoriesResponse =  await _saveLinkController.fetchCategoriesByUser();

     setState(() {
      categoryList = categoriesResponse;
      searchCategoryResult = categoriesResponse;
     });
    } catch(error) {
      CustomSnackBar.show(
        context, 
        "Erro ao recuperar categorias, tente novamente",
        duration: 3000,
      );
    } finally {
      setState(() {
        _isFetchCategoriesLoading = false;
      });
    }
  }

  void categoryFieldOnChanged(String value) {
    final newList = categoryList.where((category) {
      final lowerCaseTitle = category.title.toLowerCase();
      final lowerCaseValue = value.toLowerCase();
  
      if (lowerCaseTitle.contains(lowerCaseValue)) {
        return true;
      }

      return false;
    }).toList();

    setState(() {
      searchCategoryResult = newList;
    });
  }

  void categoryChipOnSelect(CategoryModel category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void deleteSelectedCategory() {
    setState(() {
      selectedCategory = CategoryModel();
    });
  }

  void createCategoryOnPressed() async {
    try {
      setState(() {
        _isCreateCategoryLoading = true;
      });

      final response = await _saveLinkController.createCategory(categoryController.text);
      final newCategoryList = categoryList;

      newCategoryList.add(response);

      setState(() {
        categoryList = newCategoryList;
        searchCategoryResult = newCategoryList;
      });

      categoryController.text = "";

      // rever
      CustomSnackBar.show(
        context, 
        "Categoria criada com sucesso!", 
      );
    } catch (error) {
        CustomSnackBar.show(
          context, 
          "Erro ao criar categoria! Tente novamente.", 
          duration: 3000
        );
    } finally {
      setState(() {
        _isCreateCategoryLoading = false;
      });
    }
  }

  void confirmOnPressed() async {
    try {
      setState(() {
        _isLoading = true;
      });

      var params = {
        "title": titleController.text,
        "link": linkController.text,
        "category_id": selectedCategory.id
      };

      if (widget.linkItem != null) {
        params["id"] = widget.linkItem!.id;
        await _saveLinkController.editLink(params);
      } else {
        params["favorite"] = false;
        await _saveLinkController.createLink(params);
      }

      setState(() {
        _showSucessMessage = true;
      });
    } catch (error) {
      setState(() {
        _showErrorMessage = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void onBack() {
    setState(() {
      _showErrorMessage = false;
    });
  }
}
