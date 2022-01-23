import 'package:app/ui/utils/ScaffoldBase/components/Header/header.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({ 
    Key? key, 
    required this.bodyChild, 
    required this.searchController,
  }) : super(key: key);

  final Widget bodyChild;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Header(searchController: searchController),
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
          onPressed: (){
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
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return Container(
        height: MediaQuery.of(context).size.height * 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10)
          )
        ),
        child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Salvar Link'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.cancel, color: Colors.purple, size: 25),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        ),
        ),
      );
    });
  }

}