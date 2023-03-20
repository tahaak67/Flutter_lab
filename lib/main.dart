import 'package:first_class/posts_screen.dart';
import 'package:first_class/provider/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.brown),
        home: PostsScreen(),
      ),
    ),
  );
}
