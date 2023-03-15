
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              x++;
              print("x: $x");
              setState(() {

              });
            }, child: Text("+"),),
            Text("$x", style: TextStyle(fontSize: 32),),
            ElevatedButton(onPressed: (){
              x--;
              print("x: $x");
              _refresh();
            }, child: Text("-"),),
          ],
        ),
      ),
    );
  }
  void _refresh(){
    setState(() {

    });
  }
}

