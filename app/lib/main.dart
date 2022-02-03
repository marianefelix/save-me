import 'package:app/stores/AppStore/app_store.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/pages/initial/initial.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          Provider<AppStore>.value(
            value: AppStore(),
          )
        ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
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
              floatingLabelBehavior: FloatingLabelBehavior.never,
            )
          ),
        ),
      ),
    );
    
    /*MaterialApp(
      title: "saveMe",
      home: Initial(),
    );*/
  }

}