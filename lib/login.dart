// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/home.dart';
import 'package:shared_prefrences/student.dart';
import 'package:shared_prefrences/teacher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static List<String> list = <String>['Student', 'Teacher', 'Home', 'Admin'];
  String dropdownValue = list.first;

  final emailControlar = TextEditingController();
  final passwordControlar = TextEditingController();
  final agelControlar = TextEditingController();
  final dropdown = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login-Page")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Text(
                        "Login Page",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: emailControlar,
                    decoration: const InputDecoration(
                        hintText: "E-mail",
                        prefixIcon: Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordControlar,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: agelControlar,
                    decoration: const InputDecoration(
                        hintText: "Age",
                        prefixIcon: Icon(Icons.edit),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400]),
                    child: DropdownButton<String>(
                      alignment: AlignmentDirectional.topEnd,
                      value: dropdownValue,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 260),
                        child: Icon(Icons.arrow_downward),
                      ),
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString("email", emailControlar.text.toString());
                      sp.setString(
                          "password", passwordControlar.text.toString());
                      sp.setString("age", agelControlar.text.toString());
                      sp.setString("usertype", dropdown.toString());
                      sp.setBool("logedIn", true);
                      print(sp.get('email'));
                      print(sp.get('password'));
                      print(sp.get('age'));

                      if (sp.getString('usertype') == 'student') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Student()));
                      } else if (sp.getString('usertype') == 'teacher') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Teacher()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeSctreen()));
                      }

                      // add();
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.yellow,
                        ),
                        height: 50,
                        width: 300,
                        child: const Center(child: Text("Login")),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  // Future<void> add() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   print(("ABC"));
  // }
}
