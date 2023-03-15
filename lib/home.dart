import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> cats = ["1", "2", "33", "4", "5", "6", "7"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Title",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Title"),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: ListView.separated(
                itemBuilder: (context, index) => catCard(cats[index]),
                itemCount: cats.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
              ),
            )));
  }
}

Widget catCard(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(25))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            "assets/images/cat.jpg",
            height: 100,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "قطوسة $text",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.pets,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}