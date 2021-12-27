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
      child: const MaterialApp(
        title: "saveMe",
        home: Initial(),
        
      ),
    );
    
    /*MaterialApp(
      title: "saveMe",
      home: Initial(),
    );*/
  }
}