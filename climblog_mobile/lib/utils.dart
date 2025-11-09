import 'package:flutter/material.dart';

Color getColorFromString(String colorName) {
    final colorMap = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'black': Colors.black,
      'white': Colors.white,
      'grey': Colors.grey,
      'brown': Colors.brown,
      'turquoise': Colors.teal,
    };
    return colorMap[colorName.toLowerCase()] ?? Colors.grey;
  }
