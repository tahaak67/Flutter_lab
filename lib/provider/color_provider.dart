import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier{
  MaterialColor currentColor = Colors.brown;

  void changeColor(MaterialColor newColor){
    currentColor = newColor;
    // notify listeners
    notifyListeners();
  }
}