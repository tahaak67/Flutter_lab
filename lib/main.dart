import 'package:first_class/notes_screen.dart';
import 'package:first_class/provider/NotesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal
        ),
        home: NotesScreen(),
      ),
    ),
  );
}
