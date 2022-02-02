import 'package:app/ui/pages/LinkAction/link_action.dart';
import 'package:app/ui/pages/saveLink/save_link.dart';
import 'package:app/ui/utils/ScaffoldBase/components/Header/header.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({
    Key? key,
    required this.bodyChild,
    required this.searchController,
    this.searchOnChanged,
  }) : super(key: key);

  final Widget bodyChild;
  final TextEditingController searchController;
  final Function(String)? searchOnChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Header(
          searchController: searchController,
          onChanged: searchOnChanged,
        ),
      ),
      body: SafeArea(
        child: bodyChild,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 65.0,
          child: BottomNavigationBar(
            backgroundColor: CustomColors.white,
            selectedItemColor: CustomColors.purple,
            selectedFontSize: 12.0,
            unselectedItemColor: CustomColors.grey[100],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favoritos',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 67,
        height: 67,
        child: FloatingActionButton(
          onPressed: () {
            _addLinkModelBottom(context);
          },
          backgroundColor: CustomColors.purple,
          child: const Icon(Icons.add_rounded, size: 35.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _addLinkModelBottom(context) {
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        backgroundColor: CustomColors.white,
        builder: (BuildContext bc) {
          return const LinkAction(save: false, delete: true, error: false);
        });
  }
}
