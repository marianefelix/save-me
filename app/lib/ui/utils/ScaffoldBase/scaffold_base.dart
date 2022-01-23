import 'package:app/ui/utils/ScaffoldBase/components/Header/header.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:app/ui/utils/form/text_field.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatefulWidget {
  const ScaffoldBase({
    Key? key,
    required this.bodyChild,
    required this.searchController,
  }) : super(key: key);

  final Widget bodyChild;
  final TextEditingController searchController;

  @override
  State<ScaffoldBase> createState() => _ScaffoldBaseState();
}

class _ScaffoldBaseState extends State<ScaffoldBase> {
  TextEditingController tituloController = TextEditingController();
  bool _isTituloEmpty = true;
  bool _hasTituloError = false;

  late TextEditingController _searchController;
  late Widget _bodyChild;

  @override
  void initState() {
    this._bodyChild = widget.bodyChild;
    this._searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void clearState() {
    tituloController = TextEditingController();
    _isTituloEmpty = true;
    _hasTituloError = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Header(searchController: _searchController),
      ),
      body: SafeArea(
        child: _bodyChild,
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
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 60,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Salvar Link', 
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                      Spacer(),
                      IconButton(
                        icon:
                            Icon(Icons.cancel, color: Colors.purple, size: 25),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: 
                    Text(
                      "Título:", 
                      style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Column(children: [
                      CustomTextField(
                        controller: tituloController,
                        icon: Icons.title_outlined,
                        labelText: "Digite o titulo",
                        hintText: "Titulo do Link",
                        isEmpty: _isTituloEmpty,
                        hasError: _hasTituloError
                      ),
                    ],)
                  ),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: 
                    Text(
                      "Link:", 
                      style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Column(children: [
                      CustomTextField(
                        controller: tituloController,
                        icon: Icons.link_outlined,
                        labelText: "http://link@example.com",
                        hintText: "Link",
                        isEmpty: _isTituloEmpty,
                        hasError: _hasTituloError
                      ),
                    ],)
                  ),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: 
                    Text(
                      "Categoria:", 
                      style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Column(children: [
                      CustomTextField(
                        controller: tituloController,
                        icon: Icons.search_outlined,
                        labelText: "Digite a categoria",
                        hintText: "Categoria",
                        isEmpty: _isTituloEmpty,
                        hasError: _hasTituloError
                      ),
                    ],)
                  ),
                  SizedBox(height: 10),
                  PrimaryButton(
                    label: "Cadastrar",
                    onPressed: () {
          
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
