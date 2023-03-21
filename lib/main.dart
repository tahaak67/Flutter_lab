import 'package:first_class/provider/color_provider.dart';
import 'package:first_class/ui/choose_color_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ColorProvider())
      ],
      child: const ChooseColorScreen()
    ),
  );
}


