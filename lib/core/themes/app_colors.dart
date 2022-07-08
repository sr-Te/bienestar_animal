import 'package:flutter/material.dart';

var colorList = <Color>[
  Colors.green,
  AppColors.organge,
  Colors.red,
  Colors.purple,
  Colors.blue,
  Colors.cyan,
  Colors.indigo,
  Colors.pink,
];

final priorityColor = <Color>[
  Colors.green,
  AppColors.organge,
  Colors.red,
];

class AppColors {
  static const background = Color(0xFF2A2A2A);
  static const mainButtons = Color(0xFF5568FE);
  static const textFieldBackground = Color(0xFF3D3D3D);
  static const green = Colors.green;
  static const red = Color(0xFFF0696C);
  static const organge = Colors.orange;
  static const subtitles = Colors.white54;

  static Color getRandom() => (colorList..shuffle()).first;

  ///this method loops through the list of colors circularly
  static Color getColor(int i) {
    final l = colorList.length;
    if (i > l) return colorList[i - i ~/ l * l];
    return colorList[i];
  }

  static Color getPriorityColor(int i) => priorityColor[i];
}
