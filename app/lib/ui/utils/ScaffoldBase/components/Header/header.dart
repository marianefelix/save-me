import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/text_field.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({ Key? key, required this.searchController }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //color: CustomColors.grey[100],
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10, left: 35, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*SvgPicture.asset(
                'assets/images/logo.svg', 
                fit: BoxFit.contain,
                height: 40,
              ),*/

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.68,
                height: 42,
                child: CustomTextField(
                  controller: searchController,
                  labelText: "Pesquise seus links",
                  contentPadding: EdgeInsets.zero,
                  icon: Icons.search,
                  isEmpty: searchController.text.isEmpty,
                  hasError: false
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "M", 
                  style: TextStyle(
                    color: CustomColors.purple,
                    fontSize: 14,
                  )
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(
                      width: 1,
                      color: CustomColors.purple
                    )
                  ),
                  padding: const EdgeInsets.all(11),
                  primary: CustomColors.purple[50],
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}