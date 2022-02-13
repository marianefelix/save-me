import 'package:app/models/category_model.dart';
import 'package:app/ui/utils/ElevatedButton/elevated_button.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({ 
    Key? key, 
    required this.controller, 
    required this.isEmpty, 
    required this.hasError,
    required this.categories,
    required this.categoryChipOnSelect, 
    required this.createCategoryOnPressed, 
    required this.isCreateCategoryLoading,
    this.onChanged, 
    required this.isFetchCategoriesLoading, 
  }) : super(key: key);

  final TextEditingController controller;
  final bool isEmpty;
  final void Function(String)? onChanged;
  final void Function(CategoryModel) categoryChipOnSelect;
  final void Function() createCategoryOnPressed;
  final bool isCreateCategoryLoading;
  final bool isFetchCategoriesLoading;
  final bool hasError;
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColors.grey[50],
        border: Border.all(
          color: isEmpty
            ? CustomColors.grey[200]!  
            : CustomColors.purple,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: CustomColors.purple,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: "Digite a categoria",
              contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0), 
                  topRight: Radius.circular(8.0)
                ),
                borderSide: BorderSide(
                  color: hasError
                    ? Colors.red 
                    : isEmpty
                    ? CustomColors.grey[200]!  
                    : CustomColors.purple
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0), 
                  topRight: Radius.circular(8.0)
                ),
                borderSide: BorderSide(color: CustomColors.grey[200]!),
              ),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: CustomColors.grey[300]
              ),
            ),
          ),

          Container(
            height: isFetchCategoriesLoading || categories.isEmpty ? null : 120,
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 5,
                runSpacing: 10,
                children: _buildCategoryButton()
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCreateCategoryButton() {
    return CustomElevatedButton(
      isLoading: isCreateCategoryLoading,
      onPressed: controller.text.isEmpty ? null : createCategoryOnPressed,
      backgroundColor: Colors.transparent,
      color: controller.text.isEmpty 
        ? CustomColors.grey[300]
        : CustomColors.purple, 
      label: controller.text.isEmpty
        ? 'Criar categoria' 
        : 'Criar "${controller.text}"',
      fontSize: 14,
      fontWeight: FontWeight.w500, 
      iconSize: 20, 
      icon: Icons.add, 
      padding: const EdgeInsets.all(15),
    );
  }

  List<Widget> _buildCategoryButton() {
    List<Widget> categoryButtons = [];

    if (isFetchCategoriesLoading) {
      categoryButtons.add(
        const Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: CustomColors.purple,
              ),
            ),
          ),
        )
      );
    } else if (categories.isEmpty) {
      final createButton = _buildCreateCategoryButton();
      categoryButtons.add(createButton);
    } else {
      for (var category in categories) {
        Widget button = ElevatedButton(
          onPressed: () {
            categoryChipOnSelect(category);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((_) { 
              return CustomColors.purple[200];
            }),
            padding: MaterialStateProperty.resolveWith((_) { 
              return const EdgeInsets.only(left: 8, right: 8);
            }),
            elevation: MaterialStateProperty.resolveWith((_) { 
              return 0;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Text(
            category.title,
            style: const TextStyle(
              color: CustomColors.purple,
              fontSize: 12,
              fontWeight: FontWeight.normal
            ),
          ),
        );

        categoryButtons.add(button);
      }
    }

    return categoryButtons;
  }
}