
import 'package:flutter/material.dart';

class CustomColors {
  
  CustomColors._();

  static const Color white = Color(0xFFFFFFFF);

  static const int _purplePrimaryValue = 0xFF5A56FF;

  static const int _greyPrimaryValue = 0xFF393A42;


  static const MaterialColor purple = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFF7F7FF),
      100: Color(0xFFF3F2FB),
      200: Color(0xFFECEFFD),
      300: Color(0xFFE6E6FF),
      400: Color(0xFFA09EFF),
      500: Color(_purplePrimaryValue),
    },
  );

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xFFFBFBFD),
      100: Color(0xFFD7D7D7),
      200: Color(0xFFAAB2C5),
      300: Color(0xFF8F8E94),
      400: Color(0xFF4F5159),
      500: Color(0xFF393A42),
      600: Color(_greyPrimaryValue),
    },
  );
}