import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:app/ui/utils/form/text_field.dart';
import 'package:flutter/material.dart';

class SaveLink extends StatefulWidget {
  const SaveLink({ Key? key }) : super(key: key);

  @override
  _SaveLinkState createState() => _SaveLinkState();
}

class _SaveLinkState extends State<SaveLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController categoryController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController = TextEditingController();
    linkController = TextEditingController();
    categoryController = TextEditingController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        return SizedBox(
          //height: MediaQuery.of(context).size.height * 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text(
                      'Salvar Link', 
                      style: TextStyle(
                        fontSize: 25, 
                        fontWeight: 
                        FontWeight.w500
                      )
                    ),
                  
                    const Spacer(),
                  
                    IconButton(
                      icon: Icon(
                        Icons.close, 
                        color: Colors.grey[500],
                        size: 25
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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
                      controller: titleController,
                      icon: Icons.title_outlined,
                      labelText: "Digite o titulo",
                      hintText: "Titulo do Link",
                      isEmpty: titleController.text.isEmpty,
                      hasError: false,
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
                      controller: linkController,
                      icon: Icons.link_outlined,
                      labelText: "http://link@example.com",
                      hintText: "Link",
                      isEmpty: linkController.text.isEmpty,
                      hasError: false,
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
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: categoryController,
                        icon: Icons.search_outlined,
                        labelText: "Digite a categoria",
                        hintText: "Categoria",
                        isEmpty: categoryController.text.isEmpty,
                        hasError: false,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 10),
      
                PrimaryButton(
                  label: "Cadastrar",
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      }
    );
  }
}