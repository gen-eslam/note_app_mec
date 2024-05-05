import 'package:flutter/material.dart';

abstract class ColorsManager {
  static const Color purple = Color(0xFF9395D3);
  static const Color purpleLight = Color(0xFFD6D7EF);
  //white
  static const Color white = Color(0xFFFFFFFF);
  //black
  static const Color black = Color(0xFF000000);

  static const Color red = Color(0xFFFF0000);
  static const Color redLight = Color(0xFFFFD6D7);
  static const Color green = Color(0xFF00FF00);
  static const Color greenLight = Color(0xFFD6FFD7);
  static const Color blue = Color(0xFF0000FF);
  static const Color blueLight = Color(0xFFD7D7FF);

  static const List<Color> colors = [
    red,
    green,
    blue,
  ];
}

