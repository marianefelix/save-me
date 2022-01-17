import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class SortRow extends StatelessWidget {
  const SortRow({ 
    Key? key, 
    required this.isGrid, 
    required this.selectedSortOption,
    this.toggleListVisualization, 
    this.sortOnPressed, 
  }) : super(key: key);

  final bool isGrid;
  final String selectedSortOption;
  final Function()? sortOnPressed;
  final Function()? toggleListVisualization;

  @override
  Widget build(BuildContext context) {
    // rever
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((_) { 
              return CustomColors.white;
            }),
            padding: MaterialStateProperty.resolveWith((_) { 
              return const EdgeInsets.only(left: 2);
            }),
            elevation: MaterialStateProperty.resolveWith((_) { 
              return 0;
            }),
          ),
          onPressed: sortOnPressed, 
          child: Row(
            children: [
              Text(
                selectedSortOption == 'date'
                  ? "Data de criação"
                  : "Ordem alfabética",
                style: TextStyle(
                  fontSize: 12,
                  color: CustomColors.grey[500],
                ) 
              ),
              Icon(
                Icons.arrow_downward_rounded, 
                size: 16,
                color: CustomColors.grey[500]
              ),
            ],
          )
        ),
        IconButton(
          onPressed: toggleListVisualization,
          icon: Icon(
            isGrid 
              ? Icons.list 
              : Icons.grid_view
          ),
          color: CustomColors.grey[500],
        ),
      ],
    );
  }
}