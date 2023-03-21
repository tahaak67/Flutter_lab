import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/color_provider.dart';

class ChooseColorScreen extends StatelessWidget {
  const ChooseColorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // create a provider using the context of type ColorProvider
    var provider = context.read<ColorProvider>();
    // create a watcher to get notified when something changes
    var watcher = context.watch<ColorProvider>();
    return MaterialApp(
      // use the color for the watcher
      theme: ThemeData(primarySwatch: watcher.currentColor),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.yellow,
                // change onPressed to call change color function from the provider
                onPressed: () => provider.changeColor(Colors.yellow),
                child: const Text("Yellow"),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () => provider.changeColor(Colors.red),
                child: const Text("Red"),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () => provider.changeColor(Colors.blue),
                child: const Text("Blue"),
              )

            ],
          ),
        ),
      ),
    );
  }
}