import 'package:app/stores/AppStore/app_store.dart';
import 'package:app/ui/pages/profile/profile.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/Form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({ 
    Key? key, 
    required this.searchController, 
    this.onChanged,
  }) : super(key: key);

  final TextEditingController searchController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final appStore =  Provider.of<AppStore>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 35, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appStore.categories.isEmpty 
              ? SvgPicture.asset(
                  'assets/images/logo.svg', 
                  fit: BoxFit.contain,
                  height: 40,
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.68,
                  height: 42,
                  child: CustomTextField(
                    controller: searchController,
                    labelText: "Pesquise seus links",
                    contentPadding: EdgeInsets.zero,
                    icon: Icons.search,
                    isEmpty: searchController.text.isEmpty,
                    hasError: false,
                    onChanged: onChanged,
                  ),
                ),
                
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: const Icon(Icons.person_outline, color: CustomColors.purple,),
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
    );
  }
}