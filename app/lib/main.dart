import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'ui/pages/initial/initial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child:  MaterialApp(
        title: "saveMe",
        home: const Initial(),
        theme: ThemeData(
          primaryColor: CustomColors.purple,
          focusColor: CustomColors.purple,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              fontSize: 14,
              color: CustomColors.grey[300]
            ),
            filled: true,
            fillColor: CustomColors.grey[50],
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: CustomColors.purple),
            ),
          )
        ),
      ),
    );
    
    /*MaterialApp(
      title: "saveMe",
      home: Initial(),
    );*/
  }
}