import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/login.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  String email = '';
  String password = '';
  String age = '';
  String student = '';
  @override
  void initState() {
    // TODO: implement initState
    load();
    setState(() {});
  }

  void load() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    password = sp.getString("password") ?? "";
    age = sp.getString("age") ?? "";
    student = sp.getString("uesrtype") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("Email"),
                      const Spacer(),
                      Text(email.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("password"),
                      const Spacer(),
                      Text(password.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("age"),
                      const Spacer(),
                      Text(age.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginPage()));
                  },
                  child: Container(
                    color: Colors.deepOrange,
                    height: 50,
                    width: 300,
                    child: const Center(
                      child: Text(
                        "Logout",
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
