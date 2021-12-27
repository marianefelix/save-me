import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[     
          SvgPicture.asset(
            'assets/images/background.svg', 
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          ...children,
        ],
      ),
    );
  }
}