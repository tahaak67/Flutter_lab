import 'dart:ffi';

import 'package:first_class/shared_pref.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SaveNameScreen(),
  ));
}

class Day2 extends StatefulWidget {
  Day2({Key? key}) : super(key: key);

  @override
  State<Day2> createState() => _Day2State();
}

class _Day2State extends State<Day2> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordObs = true;
  bool isTextShown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Settings"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("About app"),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                print("Settings");
              } else {
                print("about app");
              }
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (email) {
                    if (email?.isEmpty == true) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "Enter your password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordObs = !isPasswordObs;
                          setState(() {});
                        },
                        icon: isPasswordObs
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                  obscureText: isPasswordObs,
                  onChanged: (text) {
                    print(text);
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.go,
                  validator: (pass) {
                    if (pass?.isEmpty == true) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                ),
                Visibility(
                  visible: isTextShown,
                    child: Text(
                  "My Text",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
                )),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      isTextShown = !isTextShown;
                      print("shown: $isTextShown");
                      _showMyDialog(context);

                      if (formKey.currentState?.validate() == true) {
                        print("email: ${emailController.text}");
                        print("password: ${passwordController.text}");


                      /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen()));*/
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Second Screen",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
