import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveNameScreen extends StatefulWidget {
  const SaveNameScreen({Key? key}) : super(key: key);

  @override
  State<SaveNameScreen> createState() => _SaveNameScreenState();
}

class _SaveNameScreenState extends State<SaveNameScreen> {
static const NAME_KEY = "name";
SharedPreferences? pref;
var nameController = TextEditingController();

  _SaveNameScreenState() {
    getSharePref();
  }

  Future<void> getSharePref() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setName(String name) async {
    await pref?.setString(NAME_KEY, name);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (value){
                setName(value);
              },
              controller: nameController,
            ),
            ElevatedButton(onPressed: (){
              String x = pref?.getString("name") ?? "Unkown";
              print("name: $x");
              nameController.text = "name is: $x";
            }, child: Text("Get Name"))
          ],
        ),
      ),
    );;
  }
}
